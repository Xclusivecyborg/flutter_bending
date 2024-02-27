import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Clock extends StatefulWidget {
  const Clock({
    Key? key,
  }) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  String date = DateFormat.jm().format(DateTime.now());
  Timer? _timer;
  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      date = DateFormat.jms().format(DateTime.now());
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white,
                          Colors.blueGrey,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(20, 15),
                        ),
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(-5, -10),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 260,
                    width: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(30, 15),
                        ),
                      ],
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: SizedBox(
                      height: 200,
                      width: 300,
                      child: CustomPaint(
                        painter: ClockPainter(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            Text(date,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = LinearGradient(colors: [
                      Colors.blueGrey,
                      Colors.blueAccent,
                      Colors.orange[300]!,
                      Colors.pink,
                    ]).createShader(const Rect.fromLTWH(40, 100, 300, 100))
                    ..style = PaintingStyle.fill
                    ..strokeWidth = 5
                    ..color = Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  ClockPainter(this.context);
  BuildContext context;
  @override
  void paint(Canvas canvas, Size size) {
    DateTime dateTime = DateTime.now();
    final center = Offset(size.width / 2, size.height / 2);

    final radius = min(center.dx, center.dy);
    final secRadius = radius + 20;
    final minRadius = radius - 5;
    final hourRadius = radius - 20;
    final secLine = Offset(
      center.dx - secRadius * cos(dateTime.second * 6 * pi / 180),
      center.dy - secRadius * sin(dateTime.second * 6 * pi / 180),
    );
    final minLine = Offset(
      center.dx - minRadius * cos(dateTime.minute * 6 * pi / 180),
      center.dy - minRadius * sin(dateTime.minute * 6 * pi / 180),
    );
    final hourLine = Offset(
      center.dx - hourRadius * cos(dateTime.hour * 30 * pi / 180),
      center.dy - hourRadius * sin(dateTime.hour * 30 * pi / 180),
    );
    Paint secLinePaint = Paint()
      ..color = Colors.orange[300]!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;
    Paint minLinePaint = Paint()
      ..shader = const RadialGradient(colors: [
        Colors.redAccent,
        Colors.pink,
      ]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 7;
    Paint hourLinePaint = Paint()
      ..shader = const RadialGradient(colors: [
        Colors.blueGrey,
        Colors.blueAccent,
      ]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
    Paint outerDashPaint = Paint()
      ..shader = const RadialGradient(colors: [
        Colors.blueGrey,
        Colors.white,
      ]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;
    Paint circlePaint = Paint()
      ..shader = const RadialGradient(colors: [
        Colors.white,
        Colors.blueGrey,
      ]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(center, secLine, secLinePaint);
    canvas.drawLine(center, minLine, minLinePaint);
    canvas.drawLine(center, hourLine, hourLinePaint);
    canvas.drawCircle(center, 15, circlePaint);

    for (var i = 0; i < 360; i += 30) {
      final angle = i * pi / 180;
      final x = center.dx - 180 * cos(angle);
      final y = center.dy - 180 * sin(angle);
      final dx = center.dx - 170 * cos(angle);
      final dy = center.dy - 170 * sin(angle);

      canvas.drawLine(Offset(x, y), Offset(dx, dy), outerDashPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
