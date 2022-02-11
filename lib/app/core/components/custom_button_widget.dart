import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/app/core/styles/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget(
      {this.text = "",
      this.onPressed,
      this.color = AppColors.lightBlue,
      this.child,
      this.padding});
  String? text;
  Widget? child;
  Color? color;
  void Function()? onPressed;
  EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: padding,
        backgroundColor: color,
        elevation: 0,
      ),
      child: child ??
          Text(this.text!,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(color: Colors.white)),
      onPressed: onPressed,
    );
  }
}
