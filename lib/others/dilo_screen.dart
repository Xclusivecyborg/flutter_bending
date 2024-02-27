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
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              height: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 5,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 5,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
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

    final paint1 = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 3
      ..color = Colors.grey[300]!;

    final firstPath = Path();
    firstPath.moveTo(0, size.height);
    firstPath.lineTo(0, height * 0.34);
    firstPath.quadraticBezierTo(
        width * 0.07, height * 0.09, width * 0.4, height * 0.16);
    firstPath.quadraticBezierTo(width * 0.96, height * 0.24, width, 0);
    firstPath.lineTo(width, height);
    canvas.drawPath(firstPath, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
