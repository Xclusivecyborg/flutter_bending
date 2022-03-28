import 'package:flutter/material.dart';

class SideSlider extends StatelessWidget {
  const SideSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 500,
          color: Colors.brown,
          child: const StrokeSlider(
            dotColor: Colors.red,
            thumbColor: Colors.blueAccent,
            thumbSize: 40,
          ),
        ),
      ),
    );
  }
}

class StrokeSlider extends LeafRenderObjectWidget {
  final Color dotColor;
  final Color thumbColor;
  final double thumbSize;
  const StrokeSlider({
    Key? key,
    required this.dotColor,
    required this.thumbColor,
    required this.thumbSize,
  }) : super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderStrokeSlider(
      dotColor: dotColor,
      thumbColor: thumbColor,
      thumbSize: thumbSize,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant RenderStrokeSlider renderObject) {
    renderObject
      ..dotColor = dotColor
      ..thumbSize = thumbSize
      ..thumbColor = thumbColor;
  }
}

class RenderStrokeSlider extends RenderBox {
  RenderStrokeSlider({
    required Color dotColor,
    required Color thumbColor,
    required double thumbSize,
  })  : _dotColor = dotColor,
        _thumbColor = thumbColor,
        _thumbSize = thumbSize;

  Color _dotColor;
  Color _thumbColor;
  double _thumbSize;
  Color get dotColor => _dotColor;
  Color get thumbColor => _thumbColor;
  double get thumbSize => _thumbSize;
  set dotColor(Color value) {
    if (value == _dotColor) return;
    _dotColor = value;
    markNeedsPaint();
  }

  set thumbColor(Color value) {
    if (value == _thumbColor) return;
    _thumbColor = value;
    markNeedsPaint();
  }

  set thumbSize(double value) {
    if (value == _thumbSize) return;
    _thumbSize = value;
    markNeedsPaint();
  }

  @override
  void performLayout() {
    final desiredWith = constraints.maxWidth;
    final desiredHeight = thumbSize;
    size = constraints.constrain(Size(desiredWith, desiredHeight));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    canvas.translate(offset.dx, offset.dy);
  }
}
