import 'package:flutter/material.dart';

class FlutterBytesText extends StatefulWidget {
  const FlutterBytesText({
    super.key,
  });

  @override
  State<FlutterBytesText> createState() => _FlutterBytesTextState();
}

class _FlutterBytesTextState extends State<FlutterBytesText> {
  Offset _mouseHoveOffset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            const Positioned(
              bottom: -120,
              child: Text(
                'Community',
                style: TextStyle(
                  fontSize: 150,
                  fontFamily: 'Giga Sans',
                  fontWeight: FontWeight.w400,
                  letterSpacing: -15,
                ),
              ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.basic,
              child: HoverableText(
                text: 'FlutterBytes',
                mouseOffset: _mouseHoveOffset,
              ),
              onHover: (event) {
                setState(() {
                  _mouseHoveOffset = event.position;
                });
              },
              onExit: (event) {
                setState(() {
                  _mouseHoveOffset = Offset.zero;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HoverableText extends StatefulWidget {
  const HoverableText({
    super.key,
    required this.text,
    required this.mouseOffset,
  });
  final String text;
  final Offset mouseOffset;

  @override
  State<HoverableText> createState() => _HoverableTextState();
}

class _HoverableTextState extends State<HoverableText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        fontFamily: 'Giga Sans',
        letterSpacing: -15,
        foreground: Paint()
          ..shader = const RadialGradient(
            center: Alignment.topLeft,
            radius: 0.7,
            colors: [
              ShaderColors.naveyBlue,
              ShaderColors.lightBlue,
            ],
          ).createShader(widget.mouseOffset & const Size(200, 200)),
        fontSize: 150,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class ShaderColors {
  static const naveyBlue = Color(0xFF03254C);
  static const lightBlue = Color(0xFF187BCD);
}
