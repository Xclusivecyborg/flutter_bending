import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SideSlider extends StatelessWidget {
  const SideSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 300,
          child: const StrokeSlider(
            dotColor: Colors.red,
            thumbColor: Colors.purple,
            thumbSize: 30,
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
        _thumbSize = thumbSize {
    _drag = HorizontalDragGestureRecognizer()
      ..onStart = (DragStartDetails details) {
        _updatethumb(details.localPosition);
      }
      ..onUpdate = (DragUpdateDetails details) {
        _updatethumb(details.localPosition);
      };
  }

  void _updatethumb(Offset localPosition) {
    var dx = localPosition.dx.clamp(0.0, size.width);
    _currentThumbValue = dx / size.width;
    markNeedsPaint();
    markNeedsSemanticsUpdate();
  }

  Color _dotColor;
  Color _thumbColor;
  double _thumbSize;
  Color get dotColor => _dotColor;
  Color get thumbColor => _thumbColor;
  double get thumbSize => _thumbSize;
  double _currentThumbValue = 0;
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
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;
    final thumbPaint = Paint()
      ..color = thumbColor
      ..strokeWidth = size.height / 2
      ..strokeCap = StrokeCap.round;
    var thumbOffset = Offset(size.width * _currentThumbValue, size.height / 2);
    var hoverLineoffset1 = Offset(0.0, size.height / 2);
    var hoverLineoffset2 =
        Offset(size.width * _currentThumbValue, size.height / 2);
    var secondhover1 = Offset(size.width, size.height / 2);
    var secondhover2 = Offset(size.width * _currentThumbValue, size.height / 2);
    canvas.drawLine(hoverLineoffset1, hoverLineoffset2, thumbPaint);
    canvas.drawLine(secondhover1, secondhover2, paint);
    canvas.drawCircle(thumbOffset, thumbSize / 2, thumbPaint);

    canvas.restore();
  }

  late HorizontalDragGestureRecognizer _drag;

  @override
  bool hitTestSelf(Offset position) => true;
  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    if (event is PointerDownEvent) {
      _drag.addPointer(event);
    }
  }
}
