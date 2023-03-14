import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int inputTinggi = 0;
  int inputBerat = 0;
  double bmi = 0;

  bmiF(int tinggi, int berat) {
    double hasil = (berat / (tinggi / 100 * tinggi / 100));
    var kategori = '';
    var saran = '';
    if (hasil < 18.5) {
      bmi = hasil;
      kategori = "KURUS";
      saran = "Perbanyak Makanan yang Bergizi ya!";
    } else if (hasil >= 18.5 && hasil <= 24.99) {
      bmi = hasil;
      kategori = "NORMAL";
      saran = "Pertahankan Pola Hidup Sehatnya :)";
    } else if (hasil >= 25 && hasil <= 29.9) {
      bmi = hasil;
      kategori = "GEMUK";
      saran = "Perbanyak Olahraga dan Makanan Bergizi Ya!";
    } else if (hasil >= 30) {
      bmi = hasil;
      kategori = "OBESITAS";
      saran =
          "Perbanyak Olahraga, Disertai dengan Diet dan Makanan Bergizi Ya!";
    }
    return RichText(
          text: TextSpan(children: <TextSpan>[
        TextSpan(text: hasil.toStringAsFixed(2).toString(), style: const TextStyle(
            color: Colors.black
        )),
        TextSpan(text: '\n$kategori', style: const TextStyle(
            color: Colors.black
        )),
        TextSpan(text: '\n$saran', style: const TextStyle(
            color: Colors.black
        )),
      ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Tinggi Badan'),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) {
            setState(() {
              inputTinggi = int.tryParse(value) ?? 0;
            });
          },
        ),
        TextFormField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Berat Badan'),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) {
            setState(() {
              inputBerat = int.tryParse(value) ?? 0;
            });
          },
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: bmiF(inputTinggi, inputBerat),
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
          child: const Text('Tekan'),
        )
      ]),
    );
  }
}
