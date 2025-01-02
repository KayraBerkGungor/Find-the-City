import 'package:flutter/material.dart';
import 'package:konum_denemee/sonuc_ekrani.dart';

class OyunSonu extends StatefulWidget {
  final int puan;
  const OyunSonu({super.key, required this.puan});

  @override
  State<OyunSonu> createState() => _OyunSonuState();
}

class _OyunSonuState extends State<OyunSonu> {
  final List<String> _introTexts = [
    "Üzülme! Her oyun bir öğrenme fırsatıdır ve bugün çok şey öğrendin.",
    "Harika denemeydi! Herkes bazen zorlanabilir. Önemli olan oyunun tadını çıkarmak. Bir sonraki oyun için şimdiden heyecanlıyız!"
  ];

  final List<String> _gifPaths = [
    'assets/animasyon/kotubitis.gif',
    'assets/animasyon/iyibitis.gif',

  ];

  int _currentIndex = 0;
  int _currentGifIndex = 0;

  void _next() {
    setState(() {
      if (_currentIndex < _introTexts.length - 1) {
        _currentIndex++;
        _currentGifIndex = (_currentGifIndex + 1) % _gifPaths.length;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SonucEkrani(puan: widget.puan)),
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
      appBar: null,
      body: GestureDetector(
        child: Stack(
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
      ),
    );
  }
}