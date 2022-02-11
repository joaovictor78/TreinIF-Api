import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/app/core/styles/app_colors.dart';

class CustomInputWidget extends StatelessWidget {
  CustomInputWidget({this.hintText = "", this.controller, this.icon = Icons.flutter_dash, this.horizontalPadding = 28});
  String? hintText;
  IconData? icon;
  double horizontalPadding;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:  EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 6),
      child: TextFormField(
        cursorColor: AppColors.primaryColor,
        controller: controller,
        style: GoogleFonts.poppins(
          color: Colors.white
        ),
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 0),
          fillColor: AppColors.lightGrey,
          hintText: hintText!,
          hintStyle: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
          prefixIcon: Icon(icon, color: Colors.white),
          focusColor: AppColors.primaryColor,
          hoverColor: AppColors.primaryColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
