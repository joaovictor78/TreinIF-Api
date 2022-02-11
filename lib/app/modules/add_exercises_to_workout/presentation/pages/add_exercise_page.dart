import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '/app/core/enums/exercise_classification_enum.dart';
import '/app/domain/entitities/exercise_type_entity.dart';
import '/app/core/components/custom_button_widget.dart';
import '/app/core/components/custom_drop_down_widget.dart';
import '/app/core/components/custom_input_widget.dart';
import '/app/core/components/custom_text_widget.dart';
import '../../controllers/add_exercise_controller.dart';
import '/app/core/components/custom_back_button_widget.dart';
import '/app/core/styles/app_colors.dart';

class AddExercisePage extends GetView<AddExerciseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: CustomBackButtonWidget()),
        body: Obx(() {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: CustomTextWidget(
                          text: "Novo exercicio", fontSize: 18)),
                  SizedBox(
                    height: 20,
                  ),
                  CustomDropdownButton(
                      margin: EdgeInsets.only(left: 30, right: 200, top: 10),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.sports_kabaddi_rounded,
                            color: Colors.white),
                      ),
                      dropdownColor: Colors.yellow,
                      value: null,
                      onPressed: () {
                        Get.toNamed("/manage_exercises_types");
                      },
                      onChanged: (ExerciseTypeEntity? exercise) {
                        controller.exerciseTypeSelected.value = exercise;
                      },
                      style: GoogleFonts.poppins(fontSize: 14),
                      isDense: true,
                      hint: Text(controller.exerciseTypeSelected.value?.name ??
                          "Exercicios"),
                      items: controller.exercisesTypes
                          .map((element) => DropdownMenuItem(
                              value: element,
                              child: CustomTextWidget(text: element.name!)))
                          .toList()),
                  SizedBox(
                    height: 5,
                  ),
                  CustomInputWidget(
                    controller: controller.seriesNumberTextController,
                    horizontalPadding: 0,
                    hintText: "Numero de Séries",
                  ),
                  CustomInputWidget(
                    controller: controller.repeatTimeTextController,
                    horizontalPadding: 0,
                    hintText: "Tempo de repetição",
                  ),
                  CustomInputWidget(
                    controller: controller.exerciseVariationTextController,
                    horizontalPadding: 0,
                    hintText: "Variação do exercicio",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(
                        width: 10,
                      ),
                      CustomTextWidget(
                          text:
                              "Selecione os dias da semana que\nocorrerá o exercício:")
                    ],
                  ),
                  Obx(() {
                    return Container(
                      padding: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                          children: controller.daysOfWeek
                              .map((element) => _dayOfWeekComponent(
                                      element.value.isActive!,
                                      element.value.name!, onTap: () {
                                    element.value.isActive =
                                        !element.value.isActive!;
                                  }))
                              .toList()),
                    );
                  }),
                  // Spacer(),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButtonWidget(
                          text: "Adicionar",
                          color: AppColors.mediumGreen,
                          onPressed: () {
                            controller.addExercise(
                                int.parse(
                                    Get.parameters["workout_id"] as String),
                                ExerciseClassificationEnum.individual.value);
                            Navigator.pop(context);
                          },
                          padding: EdgeInsets.symmetric(horizontal: 30),
                        ),
                        CustomButtonWidget(
                          text: "Cancelar",
                          color: AppColors.red,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          padding: EdgeInsets.symmetric(horizontal: 30),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}

Widget _dayOfWeekComponent(bool isSelected, String dayOfWeek,
    {void Function()? onTap}) {
  return Container(
    width: 110,
    margin: EdgeInsets.symmetric(vertical: 3, horizontal: 1),
    child: Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color:
                    isSelected ? AppColors.mediumGreen : AppColors.mediumGrey,
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        SizedBox(width: 10),
        CustomTextWidget(text: dayOfWeek)
      ],
    ),
  );
}
