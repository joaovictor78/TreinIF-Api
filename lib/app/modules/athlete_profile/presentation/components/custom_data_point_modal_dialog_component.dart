import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/core/components/custom_button_widget.dart';
import '/app/core/components/custom_input_widget.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/styles/app_colors.dart';
import '/app/modules/athlete_profile/controllers/athlete_profile_controller.dart';

void customDataPointModalDialogComponent(BuildContext context, 
      [bool isEditable = false, int index=0, int dataPointID=0]) {
    AthleteProfileController controller = Get.find<AthleteProfileController>();
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "",
      context: context,
      pageBuilder: (_, __, ___) {
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
                                ? "Editar ponto de dado"
                                : "Adicionar novo ponto de dado",
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 25, top: 5, bottom: 10),
                        child: isEditable
                            ? Container()
                            : CustomTextWidget(
                                text:
                                    "Atraves do ponto de dados, você poderá\ncontrolar a evolução de variaveis como peso, altura etc: ",
                                fontSize: 12),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: CustomTextWidget(text: "Data :", fontSize: 14),
                      ),
                      CustomInputWidget(
                          controller: controller.dateDataPointTextController,
                          hintText: "Ex: 00/00/0000",
                          icon: Icons.date_range_outlined),
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
                                if(isEditable){
                                  controller.updateHistoricOfAthleteDate(dataPointID, index);
                                } else{
                                   controller.addHistoricOfAthlete();
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