import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  final bool visible;
  CustomLoadingIndicator(this.visible);
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 5,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }
}