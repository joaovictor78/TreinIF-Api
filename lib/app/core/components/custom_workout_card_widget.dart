import 'package:flutter/material.dart';
import '/app/domain/entitities/exercise_entity.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/styles/app_colors.dart';

class CustomWorkoutWidget extends StatelessWidget {
  CustomWorkoutWidget(this.exercise);
  ExerciseEntity exercise;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(text: exercise.exerciseType?.name ?? ""),
            CustomTextWidget(text: "Numero de serie: ${exercise.seriesNumber}"),
            CustomTextWidget(
                text: "Tempo de repetição: ${exercise.repeatTimeInSeconds}"),
            CustomTextWidget(
                text: "Variação do exercicio: ${exercise.exerciseVariation}")
          ],
        ),
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.mediumGrey),
    );
  }
}
