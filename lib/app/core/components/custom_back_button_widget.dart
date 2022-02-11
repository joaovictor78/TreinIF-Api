import 'package:flutter/material.dart';
import '/app/core/components/custom_text_widget.dart';

class CustomBackButtonWidget extends StatelessWidget {
  CustomBackButtonWidget({this.color = Colors.white});
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, border: Border.all(color: color!)),
              child: ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(Icons.arrow_back, size: 25, color: color),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            CustomTextWidget(text: "Voltar", fontSize: 15, color: color)
          ],
        ));
  }
}
