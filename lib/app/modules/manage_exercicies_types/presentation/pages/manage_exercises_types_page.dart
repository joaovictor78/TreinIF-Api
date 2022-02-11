import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/modules/manage_exercicies_types/presentation/components/exercise_type_card_component.dart';
import '/app/domain/entitities/exercise_type_entity.dart';
import '/app/modules/manage_exercicies_types/controllers/manage_exercises_types_controller.dart';
import '/app/core/components/custom_button_widget.dart';
import '/app/core/components/custom_input_widget.dart';
import '/app/core/styles/app_colors.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/components/custom_back_button_widget.dart';

class ManageExercisesTypesPage extends GetView<ManageExercisesTypesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: CustomBackButtonWidget()),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
              child: const Icon(Icons.add, color: Colors.white),
              onPressed: () {
                showDialog(context);
              }),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              CustomTextWidget(text: "Tipos de Exercicios", fontSize: 18),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (controller.exercisesTypes.isEmpty) {
                    return Center(
                      child: CustomTextWidget(
                          text:
                              "Nenhum tipo de exercicio disponivel, adicione-os!"),
                    );
                  }
                  return ListView.builder(
                      itemCount: controller.exercisesTypes.length,
                      itemBuilder: (context, index) {
                        ExerciseTypeEntity exerciseType =
                            controller.exercisesTypes[index];
                        return ExerciseTypeCardComponent(
                          exerciseType,
                          onEditable: () {
                            showDialog(context,
                                isEdtable: true, id: exerciseType.id);
                            //controller.updateExerciseType(exerciseType.id!, exerciseTypeName);
                          },
                          onDeleted: () {
                            controller.removeExerciseType(exerciseType.id!);
                          },
                        );
                      });
                }),
              )
            ],
          ),
        ));
  }

  void showDialog(BuildContext context, {bool isEdtable = false, int? id}) {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "",
      context: context,
      pageBuilder: (_, __, ___) {
        return Container(
            padding: const EdgeInsets.all(40),
            alignment: Alignment.center,
            child: Material(
              color: AppColors.primaryColor.withAlpha(3),
              child: Container(
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25, top: 20, bottom: 10),
                        child: CustomTextWidget(
                            text: isEdtable
                                ? "Editar tipo de exercício"
                                : "Cadastre o exercício",
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      CustomInputWidget(
                        controller: controller.exerciseTypeTextConstroller,
                        hintText: "Ex: Pressão",
                        icon: Icons.text_fields_rounded,
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomButtonWidget(
                              text: isEdtable ? "Confirmar" : "Adicionar",
                              color: AppColors.mediumGreen,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              onPressed: () {
                                if (isEdtable) {
                                  controller.updateExerciseType(id!);
                                } else {
                                  controller.addExerciseType();
                                }
                              },
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            CustomButtonWidget(
                              text: "Cancelar",
                              color: AppColors.red,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
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
}
