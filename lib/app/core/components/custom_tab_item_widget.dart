import 'package:flutter/material.dart';
import '/app/core/styles/app_colors.dart';

import 'custom_text_widget.dart';

class CustomTabItemWidget extends StatelessWidget {
   CustomTabItemWidget(this.title, this.pageIndex, this.index,
   this.getPageIndex);
String title;
int pageIndex;
int index;
void Function(int index) getPageIndex;
  @override
  Widget build(BuildContext context) {
    return _tabItem(this.title,  pageIndex,  index,
      getPageIndex);
  }
  Widget _tabItem(String title, int pageIndex, int index,
    void Function(int index) getPageIndex) {
  return TextButton(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
            text: title,
            fontSize: 15,
            fontWeight: pageIndex == index ? FontWeight.w600 : FontWeight.w200),
        Offstage(
          offstage: !(pageIndex == index),
          child: Container(
            width: Size.fromWidth(60).width,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.lightBlue),
          ),
        )
      ],
    ),
    onPressed: () {
      getPageIndex(index);
    },
    style: TextButton.styleFrom(),
  );
}

}