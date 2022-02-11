import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
   CustomTextWidget({ required this.text, this.fontWeight = FontWeight.normal, this.textAlign = TextAlign.left, this.fontSize=13, this.color = Colors.white, this.decoration = TextDecoration.none});
  String text;
  FontWeight? fontWeight;
  double? fontSize;
  Color? color;
  TextAlign? textAlign;
  TextDecoration? decoration;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Text(
      text,
      textAlign: textAlign,
      textScaleFactor: size.width/400,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
       decoration: decoration
      ),
    );
  }
}