import 'package:flutter/material.dart';

import 'deneme.dart';

class SoruEkrani extends StatefulWidget {
  @override
  _SoruEkraniState createState() => _SoruEkraniState();
}

class _SoruEkraniState extends State<SoruEkrani> {
  int _currentIndex = 0;
  int _currentGifIndex = 0;

  final List<String> _introTexts = [
    " Merhaba! Haydi beraber oyun oynayalım.",
    " Türkiye’den rastgele bir şehir seçeceğim ve sana şehirle alakalı ipucu vereceğim. Ardından Türkiye haritasında kaybolacağım.",
    " Senin ise bu şehri doğru bulman gerekiyor. 3 canın olacaktır. Eğer soruyu doğru bilirsen 10 puan kazanacaksın, bilemezsen ise puan kazanamayacaksın ve bir canın azalacak. Tüm canların biterse oyun biter ve o an ki puanın esas alınır.",
    " Haydi oynamaya başlayalım!"
  ];

  final List<String> _gifPaths = [
    'assets/animasyon/tanıtım.gif',
    'assets/animasyon/tanıtım2.gif',
    'assets/animasyon/tanıtım3.gif',
    'assets/animasyon/tanıtım4.gif'
  ];

  void _next() {
    setState(() {
      if (_currentIndex < _introTexts.length - 1) {
        _currentIndex++;
        _currentGifIndex = (_currentGifIndex + 1) % _gifPaths.length;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MapScreen()),
        );
      }
    });
  }

  void _previous() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
        _currentGifIndex = (_currentGifIndex - 1) % _gifPaths.length;
      }
    });
  }

  Widget _buildBottomControls() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_currentIndex != 0)
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurpleAccent.withOpacity(0.7),
              ),
              child: IconButton(
                onPressed: _previous,
                icon: const Icon(Icons.arrow_back_ios_outlined),
                iconSize: 40.0,
                color: Colors.white,
              ),
            ),
          const SizedBox(width: 20),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepPurpleAccent.withOpacity(0.7),
            ),
            child: IconButton(
              onPressed: _next,
              icon: const Icon(Icons.arrow_forward_ios_outlined),
              iconSize: 40.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/resim/haritaa.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 330.0,
            top: 50.0,
            child: Container(
              width: 600.0,
              height: 400.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_gifPaths[_currentGifIndex]),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20.0,
            right: 135,
            child: Container(
              width: 400.0,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Text(
                _introTexts[_currentIndex],
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomControls(),
          ),
        ],
      ),
    );
  }
}
