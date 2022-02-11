import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinif/app/domain/entitities/athlete_entity.dart';
import 'package:treinif/app/modules/start/submodules/workouts/domain/entitities/trainer_entity.dart';
import 'package:treinif/app/modules/start/submodules/workouts/presentation/components/trainer_custom_tile_widget.dart';
import '/app/core/enums/user_types_enum.dart';
import '/app/core/models/logged_user_po.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/team_entity.dart';
import '/app/core/components/custom_tab_item_widget.dart';
import '/app/core/styles/app_images.dart';
import '/app/core/components/custom_card_widget.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/styles/app_colors.dart';
import '/app/modules/start/submodules/workouts/controllers/workouts_controller.dart';

class WorkoutsPage extends GetView<WorkoutsController> {
  WorkoutsPage(this.userType);
  UserTypesEnum userType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(AppImages.logoLight),
            )
          ]),
      floatingActionButton: Obx(() {
        if (controller.currentIndex.value == 1) {
          return Container();
        } else {
          return FloatingActionButton(
              child: const Icon(Icons.add, color: Colors.white),
              onPressed: () {
                if (LoggedUserPO.logeedUser!.user!.userType ==
                    UserTypesEnum.athlete) {
                  Get.toNamed("/join_a_team");
                } else {
                  Get.toNamed('/create_team');
                }
              });
        }
      }),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(text: "Treinos cadastrados", fontSize: 20),
              CustomTextWidget(text: "Selecionar treino por:", fontSize: 13),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    CustomTabItemWidget(
                        "Equipe", controller.currentIndex.value, 0, (index) {
                      controller.changePage(index);
                      controller.getAllTeamsByWorkouts();
                    }),
                    SizedBox(
                      width: 20,
                    ),
                    CustomTabItemWidget(
                        "Individual", controller.currentIndex.value, 1,
                        (index) {
                      controller.changePage(index);
                      if (userType == UserTypesEnum.athlete) {
                        controller.getAllTrainersByIndividualWorkouts();
                      } else {
                        controller.getAllAthletesByIndividualWorkouts();
                      }
                    }),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: (index) {
                      controller.changePage(index);
                    },
                    children: [
                      RefreshIndicator(
                        color: AppColors.lightBlue,
                        onRefresh: () async {},
                        child: ListView.builder(
                            itemCount: controller.teamsByWorkouts.length,
                            itemBuilder: (context, index) {
                              TeamEntity team =
                                  controller.teamsByWorkouts[index];
                              return CustomListTileWidget(
                                teamEntity: team,
                                onTap: () {
                                  if (userType == UserTypesEnum.athlete) {
                                    Map<String, dynamic> data = {
                                      "team": team,
                                      "userType": LoggedUserPO
                                          .logeedUser!.user!.userType,
                                    };
                                    Get.toNamed("/manage_workout",
                                        arguments: data);
                                  } else {
                                    Get.toNamed("/list_workouts_by_team",
                                        arguments: team);
                                  }
                                },
                              );
                            }),
                      ),
                      RefreshIndicator(
                          color: AppColors.lightBlue,
                          onRefresh: () async {},
                          child: individualWorkouts()),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget individualWorkouts() {
    bool isAthlete = Get.arguments == UserTypesEnum.athlete;
    List list = isAthlete
        ? controller.trainersByIndividualWorkouts
        : controller.athletesByIndividualWorkouts;
    if (list.isEmpty) {
      return Center(
        child: CustomTextWidget(
            text: "Nenhum treino individual encontrado no momento."),
      );
    } else {
      return ListView.builder(
          itemCount: isAthlete
              ? controller.trainersByIndividualWorkouts.length
              : controller.athletesByIndividualWorkouts.length,
          itemBuilder: (context, index) {
            if (isAthlete) {
              TrainerEntity trainer =
                  controller.trainersByIndividualWorkouts[index];
              return TrainerCustomTileWidget(
                onTap: () {
                  Map _data = {};
                  _data["trainer_data"] = trainer;

                  Get.toNamed("/manage_individual_workout", arguments: _data);
                },
                trainer: trainer,
              );
            } else {
              AthleteEntity athlete =
                  controller.athletesByIndividualWorkouts[index];
              return CustomListTileWidget(
                athleteEntity: athlete,
                onTap: () {
                  Get.toNamed("/athlete_profile", arguments: athlete);
                },
              );
            }
          });
    }
  }
}
