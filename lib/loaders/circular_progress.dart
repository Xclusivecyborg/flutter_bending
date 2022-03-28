import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgress extends StatefulWidget {
  const CircularProgress({
    Key? key,
  }) : super(key: key);

  @override
  State<CircularProgress> createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress> {
  double end = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomPaint(
              painter: CircularProgressPaint(
                progress: end,
              ),
              child: Container(
                alignment: Alignment.center,
                height: 300,
                width: 300,
                child: Text(
                  '${end.toInt()}%',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onLongPress: () {
                    setState(() {
                      end = 0;
                    });
                  },
                  onTap: () {
                    setState(() {
                      if (end > 0) {
                        end--;
                      }
                    });
                  },
                  child: Container(
                    alignment: Alignment.topCenter,
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.minimize,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  '${end.toInt()}',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onLongPress: () {
                    setState(() {
                      end = 100;
                    });
                  },
                  onTap: () {
                    setState(() {
                      if (end < 100) {
                        end++;
                      }
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CircularProgressPaint extends CustomPainter {
  final double progress;
  CircularProgressPaint({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 40
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final arcpaint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Colors.greenAccent,
          Colors.amber,
          Colors.red,
        ],
      ).createShader(const Rect.fromLTWH(40, 100, 300, 100))
      ..strokeWidth = 40
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    const startAngle = pi / 2;
    double sweepAngle = 2 * pi * (progress / 100);
    canvas.drawCircle(center, radius, paint);
    canvas.drawArc(
        Rect.fromCircle(
          center: center,
          radius: radius,
        ),
        startAngle,
        sweepAngle,
        false,
        arcpaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
