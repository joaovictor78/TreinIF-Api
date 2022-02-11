import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/domain/entitities/athlete_entity.dart';
import '/app/modules/athlete_profile/domain/usecases/get_all_individual_workouts_of_athlete_usecase.dart';
import '/app/modules/athlete_profile/data/datasources/remove_data_point_of_historic_of_athlete_datasource.dart';
import '/app/modules/athlete_profile/domain/usecases/remove_individual_workout_usecase.dart';
import '/app/modules/athlete_profile/domain/usecases/update_individual_workout_status_usecase.dart';
import '/app/modules/athlete_profile/domain/usecases/update_date_data_point_of_historic_of_athlete_usecase.dart';
import '/app/modules/athlete_profile/domain/usecases/update_individual_workout_name_usecase.dart';
import '/app/modules/athlete_profile/domain/usecases/add_individual_workout_usecase.dart';
import '/app/domain/entitities/individual_workout_entity.dart';
import '/app/modules/athlete_profile/domain/usecases/add_historic_of_athlete_usecase.dart';
import '/app/core/components/custom_toast.dart';
import '/app/core/styles/app_colors.dart';
import '/app/modules/athlete_profile/domain/entities/data_point_of_%20athlete_historic_entity.dart';
import "/app/modules/athlete_profile/domain/usecases/get_athlete's_history_usecase.dart";

class AthleteProfileController extends GetxController {
  AthleteProfileController(
      {required this.getAthletesHistoryUseCase,
      required this.getAllAthleteWorkoutsUseCase,
      required this.addHistoricOfAthleteUseCase,
      required this.addIndividualWorkoutUseCase,
      required this.updateDateDataPointOfHistoricOfAthleteUseCase,
      required this.updateIndividualWorkoutNameUseCase,
      required this.updateIndividualWorkoutStatusUseCase,
      required this.removeDataPointOfHistoricOfAthleteDataSource,
      required this.removeIndividualWorkoutUseCase});
  GetAthletesHistoryUseCase getAthletesHistoryUseCase;
  GetAllIndividualWorkoutsOfAthleteUseCase getAllAthleteWorkoutsUseCase;
  AddHistoricOfAthleteUseCase addHistoricOfAthleteUseCase;
  AddIndividualWorkoutUseCase addIndividualWorkoutUseCase;
  UpdateDateDataPointOfHistoricOfAthleteUseCase
      updateDateDataPointOfHistoricOfAthleteUseCase;
  UpdateIndividualWorkoutNameUseCase updateIndividualWorkoutNameUseCase;
  UpdateIndividualWorkoutStatusUseCase updateIndividualWorkoutStatusUseCase;
  RemoveIndividualWorkoutUseCase removeIndividualWorkoutUseCase;
  RemoveDataPointOfHistoricOfAthleteDataSource
      removeDataPointOfHistoricOfAthleteDataSource;
  late PersistentBottomSheetController persistentBottomSheetController;
  var individualWorkoutSelected = Rxn<IndividualWorkoutEntity>();
  TextEditingController? workoutNameTextController;
  TextEditingController? dateDataPointTextController;
  GlobalKey<ScaffoldState> key = GlobalKey();
  var open = false.obs;
  late int athleteID;
  late AthleteEntity athleteEntity;
  @override
  void onInit() {
    athleteID = Get.arguments.id;
    athleteEntity = Get.arguments;
    getHistoricOfAthlete(Get.arguments.id);
    getIndividualWorkoutsOfAthlete(Get.arguments.id);
    workoutNameTextController = TextEditingController();
    dateDataPointTextController = TextEditingController();
    super.onInit();
  }

  var currentIndex = 0.obs;
  var dataPoints = <DataPointOfAthleteHistoricEntity>[].obs;
  var workouts = <IndividualWorkoutEntity>[].obs;
  var isLoading = false.obs;
  PageController pageController = PageController();
  changePage(int page) {
    currentIndex.value = page;
    pageController.jumpToPage(page);
  }

  getHistoricOfAthlete(int athleteID) async {
    isLoading.value = true;
    final response = await getAthletesHistoryUseCase(athleteID);
    if (!response.success) {
      isLoading.value = false;
      return CustomToast.showToast(
          "Ocorreu um erro ao pegar o historico do atleta!",
          backgroundColor: AppColors.red);
    }
    dataPoints.value = response.data!;
    isLoading.value = false;
  }

  getIndividualWorkoutsOfAthlete(int athleteID) async {
    isLoading.value = true;
    final response = await getAllAthleteWorkoutsUseCase(athleteID);
    if (!response.success) {
      isLoading.value = false;
      return CustomToast.showToast(
          "Ocorreu um erro ao pegar os treinos individuais do atleta!",
          backgroundColor: AppColors.red);
    }
    workouts.value = response.data!;
    isLoading.value = false;
  }

  addHistoricOfAthlete() async {
    String date = dateDataPointTextController!.text;
    final response = await addHistoricOfAthleteUseCase(
        athleteID, DataPointOfAthleteHistoricEntity(date: date));
    if (!response.success) {
      return CustomToast.showToast(
          "Ocorreu um erro ao adicionar o ponto de dados!",
          backgroundColor: AppColors.red);
    }
    dataPoints.add(response.data);
  }

  addIndividualWorkout() async {
    String workoutName = workoutNameTextController!.text;
    final response = await addIndividualWorkoutUseCase(athleteID, workoutName);
    if (!response.success) {
      return CustomToast.showToast(
          "Ocorreu um erro ao adicionar o treino individual!",
          backgroundColor: AppColors.red);
    }
    workouts.add(response.data!);
  }

  updateHistoricOfAthleteDate(int dataPointID, int index) async {
    String newDateDataPoint = dateDataPointTextController!.text;
    final response = await updateDateDataPointOfHistoricOfAthleteUseCase(
        athleteID, dataPointID, newDateDataPoint);
    if (!response.success) {
      return CustomToast.showToast(
          "Ocorreu um erro ao atualizar a data do ponto de dados");
    }
    dataPoints[index].date = newDateDataPoint;
    persistentBottomSheetController.close();
  }

  updateIndividualWorkoutName(int workoutID, int index) async {
    String newWorkoutName = workoutNameTextController!.text;
    final response =
        await updateIndividualWorkoutNameUseCase(workoutID, newWorkoutName);
    if (!response.success) {
      return CustomToast.showToast(
          "Ocorreu um erro ao atualizar o nome do treino!",
          backgroundColor: AppColors.red);
    }
    workouts[index].name = newWorkoutName;
    persistentBottomSheetController.close();
  }

  updateIndividualWorkoutStatus(int index) async {
    final response = await updateIndividualWorkoutStatusUseCase(
        Get.arguments.id, workouts[index].id!);
    if (!response.success) {
      return CustomToast.showToast(
          "Ocorreu um erro ao atualizar o status do treino!",
          backgroundColor: AppColors.red);
    }
    if (individualWorkoutSelected.value != null) {
      individualWorkoutSelected.value!.isActive = false;
    }
    workouts[index].isActive = !workouts[index].isActive!;
    individualWorkoutSelected.value = workouts[index];
  }

  removeHistoricOfAthlete(int dataPointID) async {
    final response = await removeDataPointOfHistoricOfAthleteDataSource(
        athleteID, dataPointID);
    if (!response.success) {
      return CustomToast.showToast(
          "Ocorreu um erro ao remover o ponto de dados!");
    }
    dataPoints.removeWhere((element) => element.id == dataPointID);
    persistentBottomSheetController.close();
    CustomToast.showToast("Ponto de Dados removido com sucesso!",
        backgroundColor: AppColors.mediumGreen);
  }

  removeIndividualWorkout(int individualWorkoutID) async {
    final response = await removeIndividualWorkoutUseCase(individualWorkoutID);
    if (!response.success) {
      return CustomToast.showToast(
          "Ocorreu um erro ao remover o treino individual!",
          backgroundColor: AppColors.red);
    }
    workouts.removeWhere((element) => element.id == individualWorkoutID);
    persistentBottomSheetController.close();
    CustomToast.showToast("Treino Individual removido com sucesso!",
        backgroundColor: AppColors.mediumGreen);
  }
}
