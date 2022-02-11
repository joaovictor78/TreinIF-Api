import 'package:flutter/material.dart';
import '/app/domain/entitities/workout_entity.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/styles/app_colors.dart';

class CustomWorkoutCheckCardWidget extends StatelessWidget {
  CustomWorkoutCheckCardWidget({this.onTap, this.onCheck, this.workoutEntity});
  void Function()? onTap;
  void Function()? onCheck;
  WorkoutEntity? workoutEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.mediumGrey),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, bottom: 30, top: 10),
        child: Row(children: [
          GestureDetector(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(text: workoutEntity?.name ?? ""),
                Row(
                  children: [
                    CustomTextWidget(
                        text: "status do treino: ",
                        fontWeight: workoutEntity?.isActive ?? false
                            ? FontWeight.normal
                            : FontWeight.w300),
                    CustomTextWidget(
                        text: workoutEntity?.isActive ?? false
                            ? "ativado"
                            : "desativado",
                        color: workoutEntity?.isActive ?? false
                            ? AppColors.green
                            : AppColors.lightGrey,
                        fontWeight: workoutEntity?.isActive ?? false
                            ? FontWeight.w700
                            : FontWeight.w500)
                  ],
                )
              ],
            ),
          ),
          Spacer(),
          InkWell(
              onTap: onCheck,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                    workoutEntity?.isActive ?? false
                        ? Icons.check_box_outlined
                        : Icons.check_box_outline_blank_rounded,
                    color: workoutEntity?.isActive ?? false
                        ? AppColors.green
                        : AppColors.lightGrey),
              )),
        ]),
      ),
    );
  }
}
