import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/modules/start/submodules/workouts/domain/usecases/get_all_trainer_by_individual_workouts_usecase.dart';
import '/app/core/components/custom_toast.dart';
import '/app/modules/start/submodules/workouts/domain/usecases/get_all_athletes_by_individual_workouts_usecase.dart';
import '/app/modules/start/submodules/workouts/domain/usecases/get_all_teams_by_workouts_usecase.dart';

class WorkoutsController extends GetxController {
  var currentIndex = 0.obs;
  PageController? pageController = PageController(initialPage: 0);
  var athletesByIndividualWorkouts = [].obs;
  var trainersByIndividualWorkouts = [].obs;
  var teamsByWorkouts = [].obs;
  var isLoading = false.obs;
  final GetAllTeamsByWorkoutsUseCase getAllTeamsByWorkoutsUseCase;
  final GetAllAthletesByIndividualWorkoutsUseCase
      getAllAthletesByIndividualWorkoutsUseCase;
  final GetAllTrainersByIndividualWorkoutsUseCase
      getAllTrainersByIndividualWorkoutsUseCase;
  WorkoutsController(
      {required this.getAllAthletesByIndividualWorkoutsUseCase,
      required this.getAllTrainersByIndividualWorkoutsUseCase,
      required this.getAllTeamsByWorkoutsUseCase});
  void changePage(index) {
    currentIndex.value = index;
    pageController!.jumpToPage(index);
  }

  @override
  void onInit() {
    getAllTeamsByWorkouts();
    super.onInit();
  }

  getAllAthletesByIndividualWorkouts() async {
    final response = await getAllAthletesByIndividualWorkoutsUseCase();
    if (!response.success) {
      return CustomToast.showToast("Ocorreu um erro ao pegar os treinos!",
          backgroundColor: Colors.red);
    }
    athletesByIndividualWorkouts.value = response.data!;
  }

  getAllTrainersByIndividualWorkouts() async {
    final response = await getAllTrainersByIndividualWorkoutsUseCase();
    if (!response.success) {
      return CustomToast.showToast("Ocorreu um erro ao pegar os treinos!",
          backgroundColor: Colors.red);
    }
    trainersByIndividualWorkouts.value = response.data!;
  }

  getAllTeamsByWorkouts() async {
    final response = await getAllTeamsByWorkoutsUseCase();
    if (!response.success) {
      return CustomToast.showToast("Ocorreu um erro ao pegar os treinos!",
          backgroundColor: Colors.red);
    }
    teamsByWorkouts.value = response.data!;
  }
}
