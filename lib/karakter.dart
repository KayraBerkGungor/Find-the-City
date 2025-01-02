import 'package:flutter/material.dart';

class SolImage extends StatefulWidget {
  @override
  _SolImageState createState() => _SolImageState();
}
class _SolImageState extends State<SolImage> {
  bool _isImageVisible = false;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isImageVisible = true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      left: _isImageVisible ? 250 : 0,
      child: AnimatedOpacity(
        duration: Duration(milliseconds:200),
        opacity: _isImageVisible ? 1.0 : 0.0,
        child: Center(
          child: _isImageVisible
              ? TweenAnimationBuilder(
            duration: Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            tween: Tween<double>(begin: 1.0, end: 0.0),
            builder: (_, double value, __) {
              return Transform.scale(
                scale: value,
                child: Container(
                  width: 200,
                  height: 350,
                  child: Image.asset(
                    'assets/resim/saklanma.png',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          )
              : SizedBox(),
        ),
      ),
    );
  }
}
