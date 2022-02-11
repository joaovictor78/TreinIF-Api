import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPaintWidget extends StatelessWidget {
  CustomPaintWidget({this.child});
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: ShapePainter(),
        child: child
      );
  }
}
class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    var path = Path();
    path.lineTo(0, size.height - 30);

    var firstStart = Offset(size.width/7, size.height-20);
    var firstEnd = Offset(size.width/2.7, size.height - 40);
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var seccondStart = Offset(size.width/1.3, size.height-50);
    var seccondEnd = Offset(size.width, size.height-10);
    path.quadraticBezierTo(seccondStart.dx, seccondStart.dy, seccondEnd.dx, seccondEnd.dy);
    
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}