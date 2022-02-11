import 'package:flutter/material.dart';
import '/app/core/styles/app_colors.dart';

class AthleteDataPointIndicatorComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: ShapePainter(),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 10),
          child: Icon(Icons.assignment_turned_in_outlined,
              size: 18, color: Color(0xff393B48)),
        )));
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = AppColors.green
      ..strokeWidth = 2
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width / 1.4, size.height);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width / 1.4, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
