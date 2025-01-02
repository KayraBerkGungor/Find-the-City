import 'giris_ekrani.dart';
import 'package:flutter/material.dart';

class SonucEkrani extends StatelessWidget {
  final int puan;
  SonucEkrani({required this.puan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          // Arka plan resmi
          Image.asset(
            'assets/resim/sonucekrani.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Toplam Skorunuz: $puan',
                  style: const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.deepPurple),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const GirisEkrani()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 60),
                    ),
                    child: const Text(
                      'Yeniden Başlayın',
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
