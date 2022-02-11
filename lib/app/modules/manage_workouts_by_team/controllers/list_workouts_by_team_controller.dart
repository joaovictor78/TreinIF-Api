import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/core/styles/app_colors.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/team_entity.dart';
import '/app/core/components/custom_toast.dart';
import '/app/modules/manage_workouts_by_team/domain/usecases/remove_workout_usecase.dart';
import '/app/modules/manage_workouts_by_team/domain/usecases/update_workout_status_usecase.dart';
import '/app/modules/manage_workouts_by_team/domain/usecases/update_workout_name_usecase.dart';
import '/app/modules/manage_workouts_by_team/domain/usecases/create_workout_usecase.dart';
import '/app/modules/manage_workouts_by_team/domain/usecases/get_all_workouts_of_team_usecase.dart';
import '/app/domain/entitities/workout_entity.dart';

class ListWorkoutsOfTeamController extends GetxController {
  ListWorkoutsOfTeamController(
      {required this.getAllWorkoutsOfTeamUseCase,
      required this.createWorkoutUseCase,
      required this.updateWorkoutNameUseCase,
      required this.updateWorkoutStatusUseCase,
      required this.removeWorkoutUseCase});

  @override
  onInit() {
    teamEntity = Get.arguments;
    getAllWorkouts(teamEntity!.id!);
    super.onInit();
  }

  @override
  onClose() {
    workoutTextName.dispose();
    super.onClose();
  }

  TeamEntity? teamEntity;
  TextEditingController workoutTextName = TextEditingController();
  GetAllWorkoutsOfTeamUseCase getAllWorkoutsOfTeamUseCase;
  CreateWorkoutUseCase createWorkoutUseCase;
  UpdateWorkoutNameUseCase updateWorkoutNameUseCase;
  UpdateWorkoutStatusUseCase updateWorkoutStatusUseCase;
  RemoveWorkoutUseCase removeWorkoutUseCase;
  late PersistentBottomSheetController persistentBottomSheetController;
  GlobalKey<ScaffoldState> key = GlobalKey();
  var open = false.obs;
  var workouts = <WorkoutEntity>[].obs;
  var loading = false.obs;
  getAllWorkouts(int teamId) async {
    loading.value = true;
    final response = await getAllWorkoutsOfTeamUseCase(teamId);
    if (!response.success) {
      return CustomToast.showToast("Ocorreu um erro ao pegar os treinos",
          backgroundColor: AppColors.red);
    }
    loading.value = false;
    workouts.value = response.data!;
  }

  createWorkout() async {
    String workoutName = workoutTextName.text;
    final response = await createWorkoutUseCase(teamEntity!.id!, workoutName);
    if (!response.success) {
      return CustomToast.showToast("Ocorreu um erro ao criar o novo treino!",
          backgroundColor: AppColors.red);
    }
    workouts.add(response.data!);
  }

  updateWorkoutStatus(int workoutID, int index) async {
    final response =
        await updateWorkoutStatusUseCase(teamEntity!.id!, workoutID);
    if (!response.success) {
      return CustomToast.showToast(
          "Ocorreu um erro ao mudar o status do treino!",
          backgroundColor: AppColors.red);
    }
    for (int count = 0; count < workouts.length; count++) {
      if (workouts[index] == workouts[count]) {
        workouts[index].isActive = true;
      } else {
        workouts[count].isActive = false;
      }
    }
  }

  updateWorkoutName(int workoutID, int index) async {
    String name = workoutTextName.text;
    final response =
        await updateWorkoutNameUseCase(teamEntity!.id!, workoutID, name);
    if (!response.success) {
      return CustomToast.showToast(
          "Ocorreu um erro ao atualizar o nome do treino",
          backgroundColor: AppColors.red);
    }
    workouts[index].name = name;
  }

  removeWorkout(int workoutID) async {
    final response = await removeWorkoutUseCase(teamEntity!.id!, workoutID);
    if (!response.success) {
      return CustomToast.showToast("Ocorreu um erro ao apagar o treino",
          backgroundColor: AppColors.red);
    }
    workouts.removeWhere((element) => element.id == workoutID);
  }
}
