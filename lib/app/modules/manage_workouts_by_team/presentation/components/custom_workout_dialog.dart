import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/modules/manage_workouts_by_team/controllers/list_workouts_by_team_controller.dart';
import '/app/core/components/custom_button_widget.dart';
import '/app/core/components/custom_input_widget.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/styles/app_colors.dart';

void customWorkoutDialog(BuildContext context,
    [bool isEditable = false, int index = 0, int workoutID = 0]) {
  ListWorkoutsOfTeamController controller =
      Get.find<ListWorkoutsOfTeamController>();
  showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "",
    context: context,
    pageBuilder: (_, __, ___) {
      if (!isEditable) controller.workoutTextName.clear();
      return Container(
          padding: EdgeInsets.all(40),
          alignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            child: Container(
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, top: 16, bottom: 10),
                      child: CustomTextWidget(
                          text: isEditable
                              ? "Editar Nome do Treino"
                              : "Novo Treino",
                          fontSize: 19),
                    ),
                    CustomInputWidget(
                      controller: controller.workoutTextName,
                      hintText: "Informe o nome do treino",
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomButtonWidget(
                            text: isEditable ? "Confirmar" : "Adicionar",
                            onPressed: () {
                              if (isEditable) {
                                controller.updateWorkoutName(workoutID, index);
                              } else {
                                controller.createWorkout();
                              }
                              Navigator.pop(context);
                            },
                            color: AppColors.mediumGreen,
                            padding: EdgeInsets.symmetric(horizontal: 25),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          CustomButtonWidget(
                            text: "Cancelar",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: AppColors.red,
                            padding: EdgeInsets.symmetric(horizontal: 25),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: AppColors.darkGrey,
                  borderRadius: BorderRadius.circular(20),
                )),
          ));
    },
  );
}
