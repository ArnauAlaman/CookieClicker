import 'dart:math' as math;

import 'package:flutter/material.dart';

class ClickyButton extends StatefulWidget {
  final Duration _duration = const Duration(milliseconds: 70);
  final Widget childe;
  final Function onPressed;

  ClickyButton({
    Key? key,
    required this.childe,
    required this.onPressed,
  });

  @override
  _ClickyButtonState createState() => _ClickyButtonState();
}

class _ClickyButtonState extends State<ClickyButton> {
  double _faceLeft = 20.0;
  double _faceTop = 0.0;
  double _sideWidth = 20.0;
  double _bottomHeight = 20.0;
  Curve _curve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.0,
      height: 80.0,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Transform(
                origin: Offset(20, 0),
                transform: Matrix4.skewY(-0.79),
                child: AnimatedContainer(
                  duration: widget._duration,
                  curve: _curve,
                  width: _sideWidth,
                  height: 60.0,
                  color: Colors.black,
                ),
              ),
              top: 0.2,
            ),
            Positioned(
              child: Transform(
                transform: Matrix4.skewX(-0.8),
                child: Transform(
                  origin: Offset(100, 10),
                  transform: Matrix4.rotationZ(math.pi),
                  child: AnimatedContainer(
                    duration: widget._duration,
                    curve: _curve,
                    width: 200.0,
                    height: _bottomHeight,
                    color: Colors.black,
                  ),
                ),
              ),
              top: 60.0,
              left: 20.1,
            ),
            AnimatedPositioned(
              duration: widget._duration,
              curve: _curve,
              child: Container(
                alignment: Alignment.center,
                width: 200.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: widget.childe,
              ),
              left: _faceLeft,
              top: _faceTop,
            ),
          ],
        ),
        onTapDown: _pressed,
        onTapUp: _unPressedOnTapUp,
        onTapCancel: _unPressed,
      ),
    );
  }

  void _pressed(_) {
    setState(() {
      _faceLeft = 0.0;
      _faceTop = 20.0;
      _sideWidth = 0.0;
      _bottomHeight = 0.0;
    });
    widget.onPressed();
  }

  void _unPressedOnTapUp(_) => _unPressed();

  void _unPressed() {
    setState(() {
      _faceLeft = 20.0;
      _faceTop = 0.0;
      _sideWidth = 20.0;
      _bottomHeight = 20.0;
    });
  }
}
