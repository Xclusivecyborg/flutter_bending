import 'package:flutter/material.dart';

class TobeyScreen1 extends StatelessWidget {
  const TobeyScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomPaint(
          painter: TobeyPainter1(),
          child: Container(
            padding: const EdgeInsets.only(top: 250, left: 30),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Welcome\n Back",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),

            // child: Text("You are here"),
          )),
    );
  }
}

class TobeyPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final center = Offset(width / 2, height / 2);

    final paint3 = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2
      ..shader = const LinearGradient(
        colors: [
          Color(0xFFF07C4E),
          Color(0xFFF85819),
        ],
        begin: Alignment.topLeft,
        end: Alignment.centerRight,
      ).createShader(Rect.fromCircle(center: center, radius: height / 2));
    Path thirdPath = Path();

    thirdPath.moveTo(width, 0.32 * height);
    thirdPath.quadraticBezierTo(
        width * 0.83, height * 0.6, width * 0.6, height * 0.62);
    // secondPath.quadraticBezierTo(width * 0.75, height * 0.72, 0, height * 0.99);
    thirdPath.lineTo(width, -3500);

    canvas.drawPath(thirdPath, paint3);

    thirdPath.close();

    final paint2 = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(255, 242, 173, 145),
          Color(0xFFF07C4E),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomLeft,
      ).createShader(Rect.fromCircle(center: center, radius: height / 2));

    Path secondPath = Path();

    secondPath.moveTo(width * 0.65, 0);
    secondPath.quadraticBezierTo(
        width * 0.84, height * 0.18, width * 0.80, height * 0.4);
    secondPath.quadraticBezierTo(width * 0.75, height * 0.78, 0, height * 0.99);
    secondPath.lineTo(0, 0);

    canvas.drawPath(secondPath, paint2);

    secondPath.close();

    final paint1 = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(222, 119, 17, 6),
          Color.fromARGB(255, 221, 37, 17),
        ],
        begin: Alignment.topLeft,
        end: Alignment.centerRight,
      ).createShader(Rect.fromCircle(center: center, radius: height / 2));

    Path firstPath = Path();

//Move our path to 65 percent of the screen before drawing anything
    firstPath.moveTo(width * 0.52, 0);
    //Draw a curve to 45% of the height of the screen
    firstPath.quadraticBezierTo(
        width * 0.72, height * 0.2, center.dx * 1.12, height * 0.46);
    //Draw a curve to 85% of the height of the screen
    firstPath.quadraticBezierTo(width * 0.40, height * 0.69, 0, height * 0.82);
    firstPath.lineTo(0, 0);

    canvas.drawPath(firstPath, paint1);

    firstPath.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class TobeyScreen2 extends StatelessWidget {
  const TobeyScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomPaint(
          painter: TobeyPainter2(),
          child: Container(
            padding: const EdgeInsets.only(top: 200, left: 30),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Welcome\n Back",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),

            // child: Text("You are here"),
          )),
    );
  }
}

class TobeyPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    final center = Offset(width / 2, height / 2);

    final paint3 = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2
      ..shader = const LinearGradient(
        colors: [
          Color(0xFFF07C4E),
          Color(0xFFF85819),
        ],
        begin: Alignment.topLeft,
        end: Alignment.centerRight,
      ).createShader(Rect.fromCircle(center: center, radius: height / 2));
    Path thirdPath = Path();

    thirdPath.moveTo(width * 0.85, 0);
    thirdPath.quadraticBezierTo(
        width * 1.1, height * 0.2, width * 0.7, height * 0.37);
    // secondPath.quadraticBezierTo(width * 0.75, height * 0.72, 0, height * 0.99);
    thirdPath.lineTo(0, 0);

    canvas.drawPath(thirdPath, paint3);

    thirdPath.close();

    final paint2 = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2
      ..shader = const LinearGradient(
        colors: [
          Color.fromARGB(255, 242, 173, 145),
          Color(0xFFF07C4E),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomLeft,
      ).createShader(Rect.fromCircle(center: center, radius: height / 2));

    Path secondPath = Path();

    secondPath.moveTo(width * 0.65, 0);
    secondPath.quadraticBezierTo(
        width * 0.98, height * 0.15, center.dx * 1.612, height * 0.323);
    secondPath.quadraticBezierTo(width * 0.58, height * 0.52, 2, height * 0.42);

    secondPath.lineTo(0, 0);

    canvas.drawPath(secondPath, paint2);

    secondPath.close();

    final paint1 = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2
      ..shader = const RadialGradient(
        colors: [
          Color.fromARGB(222, 119, 17, 6),
          Color.fromARGB(255, 221, 37, 17),
        ],
        // begin: Alignment.topLeft,
        // end: Alignment.bottomRight,
      ).createShader(Rect.fromCircle(center: center, radius: height / 2));

    Path firstPath = Path();

//Move our path to 65 percent of the screen before drawing anything
    firstPath.moveTo(width * 0.62, 0);
    //Draw a curve to 45% of th8 height of the screen
    firstPath.quadraticBezierTo(
        width * 0.85, height * 0.13, center.dx * 1.43, height * 0.29);
    //Draw a curve to 85% of the height of the screen
    firstPath.quadraticBezierTo(width * 0.53, height * 0.47, 0, height * 0.42);
    firstPath.lineTo(0, 0);

    canvas.drawPath(firstPath, paint1);

    firstPath.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
