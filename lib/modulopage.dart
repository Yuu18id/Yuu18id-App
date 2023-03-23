import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ModuloPage extends StatefulWidget {
  const ModuloPage({super.key});

  @override
  State<ModuloPage> createState() => _ModuloPageState();
}

class _ModuloPageState extends State<ModuloPage> {

    int nilaia = 0;
    int nilaib = 0;

    modu(int a, int b) {
        return RichText(text: TextSpan(
            children:[ TextSpan(
                text: 'Hasil Bagi : ${a/b}\n'
            ),
            TextSpan(
                text: 'Sisa Bagi  : ${a%b}'
            )
        ]));
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
         children: [
          Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: 300,
            child: TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Nilai 1'),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (value) {
                setState(() {
                  nilaia = int.tryParse(value) ?? 0;
                });
              },
            ),
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: 300,
            child: TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Nilai 2'),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (value) {
                setState(() {
                  nilaib = int.tryParse(value) ?? 0;
                });
              },
            ),
          ),
        
          
          
        ]),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: modu(nilaia, nilaib),
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
        child: const Icon(Icons.calculate),
      ),
    );
  }
}
