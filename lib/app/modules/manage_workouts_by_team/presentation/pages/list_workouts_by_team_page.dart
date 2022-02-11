import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/core/models/logged_user_po.dart';
import '/app/domain/entitities/workout_entity.dart';
import '/app/modules/manage_workouts_by_team/presentation/components/custom_workout_dialog.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/team_entity.dart';
import '/app/modules/manage_workouts_by_team/controllers/list_workouts_by_team_controller.dart';
import '/app/core/components/custom_back_button_widget.dart';
import '/app/core/components/custom_button_widget.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/components/custom_workout_check_card_widget.dart';
import '/app/core/styles/app_colors.dart';

class ListWorkoutsByTeamPage extends GetView<ListWorkoutsOfTeamController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.key,
      appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: CustomBackButtonWidget()),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  CustomTextWidget(
                      text: "Equipe: ${(Get.arguments as TeamEntity).name}",
                      fontSize: 20),
                  SizedBox(
                    width: 10,
                  ),
                  CustomTextWidget(
                    text: (Get.arguments as TeamEntity).code?.code ?? "",
                    fontSize: 19,
                  ),
                ],
              ),
              CustomTextWidget(text: "Treinos Cadastrados", fontSize: 17),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Obx(() {
                  if (controller.loading.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (controller.workouts.isEmpty) {
                    return Center(
                      child: CustomTextWidget(
                          text: "Nenhum treino encontrado, adicione-os!"),
                    );
                  }
                  return ListView.separated(
                      shrinkWrap: true,
                      itemCount: controller.workouts.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          Padding(padding: EdgeInsets.all(7)),
                      itemBuilder: (context, index) {
                        WorkoutEntity workout = controller.workouts[index];
                        return GestureDetector(
                          onLongPress: () {
                            if (!controller.open.value) {
                              controller.persistentBottomSheetController =
                                  controller.key.currentState!.showBottomSheet(
                                      (_) => Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.4,
                                          width: double.maxFinite,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 6,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          AppColors.mediumGrey),
                                                  width: MediaQuery.of(context)
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
                                                      Icon(Icons.settings),
                                                      CustomTextWidget(
                                                          text:
                                                              "Gerenciar Treino Individual",
                                                          fontSize: 15),
                                                    ]),
                                                SizedBox(height: 30),
                                                ListTile(
                                                  onTap: () {
                                                    customWorkoutDialog(
                                                        context,
                                                        true,
                                                        index,
                                                        workout.id!);
                                                  },
                                                  leading:
                                                      Icon(Icons.sort_by_alpha),
                                                  title: CustomTextWidget(
                                                      text:
                                                          "Editar Nome do Treino",
                                                      fontSize: 14),
                                                ),
                                                Divider(
                                                    color: AppColors.lightGrey,
                                                    height: 20),
                                                ListTile(
                                                  onTap: () {
                                                    controller.removeWorkout(
                                                        workout.id!);
                                                  },
                                                  leading: Icon(Icons.delete),
                                                  title: CustomTextWidget(
                                                      text: "Remover Treino",
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
                                      backgroundColor: AppColors.darkGrey);
                            } else {
                              controller.persistentBottomSheetController
                                  .close();
                            }
                            controller.open.value = !controller.open.value;
                          },
                          child: CustomWorkoutCheckCardWidget(
                            workoutEntity: workout,
                            onCheck: () {
                              controller.updateWorkoutStatus(
                                  workout.id!, index);
                            },
                            onTap: () {
                              Map<String, dynamic> data = {
                                "team": controller.teamEntity,
                                "userType":
                                    LoggedUserPO.logeedUser!.user!.userType,
                                "workout_id": workout.id!
                              };
                              Get.toNamed("/manage_workout", arguments: data);
                            },
                          ),
                        );
                      });
                }),
              ))
            ]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: AppColors.darkGrey,
              height: 80,
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 18),
                child: CustomButtonWidget(
                    text: "ADICIONAR UM NOVO TREINO",
                    onPressed: () {
                      customWorkoutDialog(context);
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
