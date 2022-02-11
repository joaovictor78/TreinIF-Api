import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/domain/entitities/workout_entity.dart';
import '/app/core/styles/app_colors.dart';
import '/app/modules/athlete_profile/presentation/components/custom_workout_modal_dialog_component.dart';
import '/app/domain/entitities/individual_workout_entity.dart';
import '/app/core/components/custom_workout_check_card_widget.dart';
import '/app/modules/athlete_profile/controllers/athlete_profile_controller.dart';
import '/app/core/components/custom_text_widget.dart';

class AthleteWorkoutsComponent extends StatelessWidget {
  AthleteProfileController _athleteProfileController =
      Get.find<AthleteProfileController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 20),
          child: CustomTextWidget(text: "Treinos do Atleta"),
        ),
        Expanded(
            child: _athleteProfileController.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : _athleteProfileController.workouts.isEmpty
                    ? Container(
                        padding: EdgeInsets.only(top: 70),
                        alignment: Alignment.topCenter,
                        child: CustomTextWidget(
                            text:
                                "Nenhum treino encontrado, adicione-os\nao historico!",
                            textAlign: TextAlign.center))
                    : ListView.builder(
                        padding: EdgeInsets.only(top: 10),
                        itemCount: _athleteProfileController.workouts.length,
                        itemBuilder: (_, index) {
                          IndividualWorkoutEntity individualWorkout =
                              _athleteProfileController.workouts[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: GestureDetector(
                              onLongPress: () {
                                if (!_athleteProfileController.open.value) {
                                  _athleteProfileController
                                          .persistentBottomSheetController =
                                      _athleteProfileController
                                          .key.currentState!
                                          .showBottomSheet(
                                              (_) => Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.4,
                                                  width: double.maxFinite,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: 6,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: AppColors
                                                                  .mediumGrey),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                        ),
                                                        SizedBox(height: 10),
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(Icons
                                                                  .settings),
                                                              CustomTextWidget(
                                                                  text:
                                                                      "Gerenciar Treino Individual",
                                                                  fontSize: 15),
                                                            ]),
                                                        SizedBox(height: 30),
                                                        ListTile(
                                                          onTap: () {
                                                            customWorkoutModalDialogComponent(
                                                                context,
                                                                true,
                                                                index);
                                                          },
                                                          leading: Icon(Icons
                                                              .sort_by_alpha),
                                                          title: CustomTextWidget(
                                                              text:
                                                                  "Editar Nome do Treino",
                                                              fontSize: 14),
                                                        ),
                                                        Divider(
                                                            color: AppColors
                                                                .lightGrey,
                                                            height: 20),
                                                        ListTile(
                                                          onTap: () {
                                                            _athleteProfileController
                                                                .removeIndividualWorkout(
                                                                    individualWorkout
                                                                        .id!);
                                                          },
                                                          leading: Icon(
                                                              Icons.delete),
                                                          title: CustomTextWidget(
                                                              text:
                                                                  "Remover Treino",
                                                              fontSize: 14),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(30),
                                                  topRight: Radius.circular(30),
                                                ),
                                              ),
                                              backgroundColor:
                                                  AppColors.darkGrey);
                                } else {
                                  _athleteProfileController
                                      .persistentBottomSheetController
                                      .close();
                                }
                                _athleteProfileController.open.value =
                                    !_athleteProfileController.open.value;
                              },
                              child: CustomWorkoutCheckCardWidget(
                                  workoutEntity: WorkoutEntity(
                                      id: individualWorkout.id,
                                      isActive: individualWorkout.isActive,
                                      name: individualWorkout.name),
                                  onCheck: () {
                                    _athleteProfileController
                                        .updateIndividualWorkoutStatus(index);
                                  },
                                  onTap: () {
                                    Map _data = {};
                                    _data["athlete_data"] =
                                        _athleteProfileController.athleteEntity;
                                    _data["workout_id"] = individualWorkout.id;
                                    Get.toNamed("/manage_individual_workout",
                                        arguments: _data);
                                  }),
                            ),
                          );
                        }))
      ],
    );
  }
}
