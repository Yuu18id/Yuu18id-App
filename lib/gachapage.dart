import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

class GachaPage extends StatefulWidget {
  const GachaPage({Key? key}) : super(key: key);

  @override
  State<GachaPage> createState() => _GachaPageState();
}

class _GachaPageState extends State<GachaPage> {
  int saldo = 50;
  int pull = 0;
  Map<String, int> own = {'6star': 0, '5star': 0, '4star': 0, '3star': 0};
  Map<String, List<String>> ownChar = {
    '6star': [],
    '5star': [],
    '4star': [],
    '3star': []
  };


  hello() {
    debugPrint('jalan');
  }

  // ignore: body_might_complete_normally_nullable
  Future<List<dynamic>?> gacha(int value) async {
    File file = File('character_table.json');
    final String jsonString = await file.readAsString();
    final jsonData = json.decode(jsonString);

    Map<String, List<String>> op = {
      '6star': [],
      '5star': [],
      '4star': [],
      '3star': []
    };

    for (Map i in jsonData.values) {
      if (i['rarity'] == 5 &&
          i['description'] != Null &&
          i['subProfessionId'] != "notchar1" &&
          i['subProfessionId'] != "notchar2" &&
          i['isNotObtainable'] == false) {
        op['6star']?.add(i['name']);
      } else if (i['rarity'] == 4 &&
          i['description'] != Null &&
          i['subProfessionId'] != "notchar1" &&
          i['subProfessionId'] != "notchar2" &&
          i['isNotObtainable'] == false) {
        op['5star']?.add(i['name']);
      } else if (i['rarity'] == 3 &&
          i['description'] != Null &&
          i['subProfessionId'] != "notchar1" &&
          i['subProfessionId'] != "notchar2" &&
          i['isNotObtainable'] == false) {
        op['4star']?.add(i['name']);
      } else if (i['rarity'] == 2 &&
          i['description'] != Null &&
          i['subProfessionId'] != "notchar1" &&
          i['subProfessionId'] != "notchar2" &&
          i['isNotObtainable'] == false) {
        op['3star']?.add(i['name']);
      }
    }
    for (int i in Iterable.generate(value)) {
      List<String> temp = [];
      var rng = Random();
      int rate = rng.nextInt(99) + 1;
      if (rate < 2) {
        int rngChar = rng.nextInt(op['6star']!.length);
        String? get = op['6star']?[rngChar];
        temp.add('★★★★★★\t  ${get.toString()}');
        ownChar['6star']?.add(get.toString());
      } else if (rate > 1 && rate < 16) {
        int rngChar = rng.nextInt(op['5star']!.length);
        String? get = op['5star']?[rngChar];
        temp.add('★★★★★\t\t  ${get.toString()}');
        ownChar['5star']?.add(get.toString());
      } else if (rate > 15 && rate < 51) {
        int rngChar = rng.nextInt(op['4star']!.length);
        String? get = op['4star']?[rngChar];
        temp.add('★★★★\t\t  ${get.toString()}');
        ownChar['4star']?.add(get.toString());
      } else if (rate > 50 && rate < 100) {
        int rngChar = rng.nextInt(op['3star']!.length);
        String? get = op['3star']?[rngChar];
        temp.add('★★★\t\t  ${get.toString()}');
        ownChar['3star']?.add(get.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('testing'),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: FutureBuilder(
                        future: gacha(10),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(snapshot.data![index]['name']),
                                  subtitle:
                                      Text(snapshot.data![index]['rarity']),
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return const Center(child: CircularProgressIndicator());
                        },
                      ),
                      actions: [
                        ElevatedButton(
                            child: const Text('Tutup'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            })
                      ],
                    );
                  });
            },
            child: const Text('10 Pull'),
          )
        ],
      ),
    );
  }
}
