import 'package:flutter/material.dart';
import '/app/domain/entitities/exercise_type_entity.dart';
import '/app/core/styles/app_colors.dart';
import '/app/core/components/custom_text_widget.dart';

class ExerciseTypeCardComponent extends StatelessWidget {
  ExerciseTypeCardComponent(this.exerciseType,
      {this.onEditable, this.onDeleted});
  ExerciseTypeEntity exerciseType;
  void Function()? onEditable;
  void Function()? onDeleted;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.mediumGrey, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          CustomTextWidget(text: exerciseType.name ?? ""),
          Spacer(),
          IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: EdgeInsets.zero,
              onPressed: onEditable,
              icon: Icon(Icons.edit_rounded)),
          IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: EdgeInsets.zero,
              onPressed: onDeleted,
              icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
