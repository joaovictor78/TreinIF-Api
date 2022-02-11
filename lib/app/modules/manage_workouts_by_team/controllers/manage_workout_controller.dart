import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '/app/modules/manage_workouts_by_team/domain/usecases/get_all_team_exercises_by_day_of_week_as_athlete_usecase.dart';
import '/app/modules/manage_workouts_by_team/domain/usecases/get_all_athletes_of_team_usecase.dart';
import '/app/core/enums/user_types_enum.dart';
import '/app/domain/entitities/athlete_entity.dart';
import '/app/modules/manage_workouts_by_team/domain/usecases/get_all_exercises_by_day_of_week_usecase.dart';
import '/app/core/components/custom_toast.dart';
import '/app/core/enums/exercise_classification_enum.dart';
import '/app/domain/entitities/exercise_entity.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/team_entity.dart';

class ManageWorkoutController extends GetxController {
  ManageWorkoutController(
      this.getAllExercisesByDayOfWeek,
      this.getAllTeamExercisesByDayOfWeekAsAthleteUseCase,
      this.getAllAthletesOfTeamUseCase);
  GetAllExercisesByDayOfWeekUseCase getAllExercisesByDayOfWeek;
  GetAllTeamExercisesByDayOfWeekAsAthleteUseCase
      getAllTeamExercisesByDayOfWeekAsAthleteUseCase;
  GetAllAthletesOfTeamUseCase getAllAthletesOfTeamUseCase;
  var currentIndex = 0.obs;
  PageController? pageController = PageController(initialPage: 0);
  var exercises = <ExerciseEntity>[].obs;
  var athletes = <AthleteEntity>[].obs;
  DateTime selectedDate = DateTime.now().subtract(const Duration(days: 2));
  late TeamEntity teamEntity;
  late int workoutID;
  bool isAthlete = false;
  @override
  onInit() {
    teamEntity = Get.arguments["team"];
    if (Get.arguments["userType"] == UserTypesEnum.athlete) {
      isAthlete = true;
    } else {
      isAthlete = false;
      workoutID = Get.arguments["workout_id"];
      getExercisesByDayOfWeek(
          workoutID, DateFormat('EEEE').format(selectedDate));
    }
    super.onInit();
  }

  getExercisesByDayOfWeek(int workoutID, String dayOfWeek) async {
    final response = await getAllExercisesByDayOfWeek(
        workoutID, dayOfWeek, ExerciseClassificationEnum.team.value);
    if (!response.success) {
      return CustomToast.showToast("Ocorreu um erro ao pegar os exercicios!",
          backgroundColor: Colors.red);
    }
    exercises.value = response.data;
  }

  getAllAthletesOfTeam() async {
    final response = await getAllAthletesOfTeamUseCase(teamEntity.id!);
    if (!response.success) {
      return CustomToast.showToast(
          "Ocorreu um erro ao pegar os atletas da equipe!",
          backgroundColor: Colors.red);
    }
    athletes.value = response.data!;
  }

  void changePage(index) {
    currentIndex.value = index;
    pageController!.jumpToPage(index);
  }
}
