import 'package:flutter/material.dart';

class DiloScreen extends StatelessWidget {
  const DiloScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          CustomPaint(
            painter: DiloPainter(),
            child: Container(
              padding: const EdgeInsets.only(top: 250, left: 30),
              // color: Colors.blue,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              height: 400,
            ),
          ),
        ],
      ),
    );
  }
}

class DiloPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final center = Offset(width / 2, height / 2);

    final paint1 = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 3
      ..color = Colors.green;

    final firstPath = Path();
    firstPath.moveTo(0, size.height);
    firstPath.lineTo(0, height * 0.3);
    firstPath.quadraticBezierTo(
        width * 0.15, height * 0.1, width * 0.3, height * 0.2);
    firstPath.quadraticBezierTo(
        width * 0.15, height * 0.1, width * 0.3, height * 0.2);

    canvas.drawPath(firstPath, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
