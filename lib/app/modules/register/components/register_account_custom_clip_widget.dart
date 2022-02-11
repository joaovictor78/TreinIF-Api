import 'package:flutter/material.dart';
import 'dart:math' as math;
class RegisterAccountCustomClipPathWidget extends StatelessWidget {
  const RegisterAccountCustomClipPathWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Transform.rotate(
      angle: math.pi,
      child: Container(
  
  alignment: Alignment.center,
  child: ClipPath(
      clipper: RegisterAccountCustomClipWidget(),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Container(
          color: Colors.white
          
        ),
      ),
  ),
),
    );
  }
}


class RegisterAccountCustomClipWidget extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
     path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 5, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 5), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
