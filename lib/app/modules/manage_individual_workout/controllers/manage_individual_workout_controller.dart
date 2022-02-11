import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '/app/modules/manage_individual_workout/domain/usecases/get_individual_exercises_by_day_of_week_as_athlete_usecase.dart';
import '/app/core/enums/user_types_enum.dart';
import '/app/core/models/logged_user_po.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/trainer_entity.dart';
import '/app/domain/entitities/athlete_entity.dart';
import '/app/modules/manage_individual_workout/domain/usecases/remove_exercise_usecase.dart';
import '/app/core/components/custom_toast.dart';
import '/app/core/enums/exercise_classification_enum.dart';
import '/app/domain/entitities/exercise_entity.dart';
import '/app/modules/manage_individual_workout/domain/usecases/get_exercises_by_day_of_week_usecase.dart';

class ManageIndividualWorkoutController extends GetxController {
  ManageIndividualWorkoutController(
      {required this.getExercisesByDayOfWeekUseCase,
      required this.getIndividualExercisesByDayOfWeekAsAthleteUseCase,
      required this.removeExerciseUseCase});
  GetExercisesByDayOfWeekUseCase getExercisesByDayOfWeekUseCase;
  GetIndividualExercisesByDayOfWeekAsAthleteUseCase
      getIndividualExercisesByDayOfWeekAsAthleteUseCase;
  RemoveExerciseUseCase removeExerciseUseCase;
  var exercises = <ExerciseEntity>[].obs;
  DateTime selectedDate = DateTime.now().subtract(const Duration(days: 2));
  late AthleteEntity athleteEntity;
  late TrainerEntity trainerEntity;
  late int workoutID;
  @override
  onInit() {
    if (LoggedUserPO.logeedUser!.user!.userType == UserTypesEnum.athlete) {
      trainerEntity = Get.arguments["trainer_data"];
    } else {
      athleteEntity = Get.arguments["athlete_data"];
      workoutID = Get.arguments["workout_id"];
      getExercisesByDayOfWeek(
          workoutID, DateFormat('EEEE').format(selectedDate));
    }
    super.onInit();
  }

  getExercisesByDayOfWeek(int workoutID, String dayOfWeek) async {
    final response = await getExercisesByDayOfWeekUseCase(
        workoutID, dayOfWeek, ExerciseClassificationEnum.individual.value);
    if (!response.success) {
      return CustomToast.showToast("Ocorreu um erro ao pegar os exercicios!",
          backgroundColor: Colors.red);
    }
    exercises.value = response.data;
  }

  getExercisesByDayOfWeekAsAthlete(String dayOfWeek) async {
    final response =
        await getIndividualExercisesByDayOfWeekAsAthleteUseCase(dayOfWeek);
    if (!response.success) {
      return CustomToast.showToast("Ocorreu um erro ao pegar os exercicios!",
          backgroundColor: Colors.red);
    }
    exercises.value = response.data!;
  }

  removeExercise(int workoutID, int exerciseID, int index) async {
    final response = await removeExerciseUseCase(workoutID, exerciseID);
    if (!response.success) {
      return CustomToast.showToast(
          "Ocorreu um erro ao apagar o exercicio, tente novamente!",
          backgroundColor: Colors.red);
    }
    exercises.removeAt(index);
  }
}
