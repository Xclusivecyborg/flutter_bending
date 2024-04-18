import 'dart:math' as math;

import 'package:flutter/material.dart';

class FlipCardAnimation extends StatefulWidget {
  const FlipCardAnimation({super.key});

  @override
  State<FlipCardAnimation> createState() => _FlipCardAnimationState();
}

class _FlipCardAnimationState extends State<FlipCardAnimation> {
  double _rotationRadians = 0;
  double _defaultHeightAndWidth = 250;
  bool _isFlipped = false;
  final int _milliseconds = 300;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isFlipped = !_isFlipped;
              _isFlipped ? _rotationRadians = math.pi : _rotationRadians = 0;
              _isFlipped
                  ? _defaultHeightAndWidth = 300
                  : _defaultHeightAndWidth = 250;
            });
          },
          child: AnimatedContainer(
            curve: Curves.linear,
            transformAlignment: Alignment.center,
            transform: Matrix4.rotationY(_rotationRadians),
            duration: Duration(milliseconds: _milliseconds),
            height: _defaultHeightAndWidth,
            width: _defaultHeightAndWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_defaultHeightAndWidth / 6),
              gradient: const LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.purple,
                ],
              ),
            ),
            alignment: Alignment.center,
            child: FutureBuilder(
                future: Future.delayed(
                  Duration(milliseconds: _milliseconds ~/ 2),
                  () => _isFlipped,
                ),
                builder: (context, snapshot) {
                  return Container(
                    transformAlignment: Alignment.center,
                    transform: Matrix4.rotationY(
                      (snapshot.data ?? false) ? math.pi : 0,
                    ),
                    child: Text(
                      (snapshot.data ?? false) ? 'Back' : 'Front',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
