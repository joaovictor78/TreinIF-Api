import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/core/components/custom_button_widget.dart';
import '/app/core/components/custom_input_widget.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/styles/app_colors.dart';
import '/app/modules/athlete_profile/controllers/athlete_profile_controller.dart';

void customWorkoutModalDialogComponent(BuildContext context,
      [bool isEditable = false, int index=0, int workoutID=0]) {
    AthleteProfileController controller = Get.find<AthleteProfileController>();
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "",
      context: context,
      pageBuilder: (_, __, ___) {
        if (!isEditable) controller.workoutNameTextController?.clear();
        return Container(
            padding: EdgeInsets.all(40),
            alignment: Alignment.center,
            child: Material(
              color: AppColors.primaryColor.withAlpha(3),
              child: Container(
                  height: isEditable ? 250 : 310,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 16),
                        child: CustomTextWidget(
                            text: isEditable
                                ? "Editar nome do treino"
                                : "Adicionar novo treino",
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: CustomTextWidget(text: "Nome :", fontSize: 14),
                      ),
                      CustomInputWidget(
                          controller: controller.workoutNameTextController,
                          hintText: "Ex: Treino1",
                          icon: Icons.sports_volleyball_sharp),
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
                                  controller.updateIndividualWorkoutName(workoutID, index);
                                } else {
                                  controller.addIndividualWorkout();
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
