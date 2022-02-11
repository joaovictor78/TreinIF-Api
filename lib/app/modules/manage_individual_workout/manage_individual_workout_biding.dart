import 'package:get/get.dart';
import '/app/modules/manage_individual_workout/data/datasources/remove_exercise_datasource.dart';
import '/app/modules/manage_individual_workout/data/repositories/remove_exercise_repository.dart';
import '/app/modules/manage_individual_workout/domain/usecases/remove_exercise_usecase.dart';
import '/app/modules/manage_individual_workout/controllers/manage_individual_workout_controller.dart';
import '/app/modules/manage_individual_workout/data/datasources/get_exercises_by_day_of_week_datasource.dart';
import '/app/modules/manage_individual_workout/data/repositories/get_exercises_by_day_of_week_repository.dart';
import '/app/modules/manage_individual_workout/domain/usecases/get_exercises_by_day_of_week_usecase.dart';
import '/app/core/network/custom_dio/custom_dio.dart';

class ManageIndividualWorkoutBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RemoveExerciseDataSource(Get.find<CustomDio>()));
    Get.lazyPut(
        () => RemoveExerciseRepository(Get.find<RemoveExerciseDataSource>()));
    Get.lazyPut(
        () => RemoveExerciseUseCase(Get.find<RemoveExerciseRepository>()));
    Get.lazyPut(() => GetExercisesByDayOfWeekDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => GetExercisesByDayOfWeekRepository(
        Get.find<GetExercisesByDayOfWeekDataSource>()));
    Get.lazyPut(() => GetExercisesByDayOfWeekUseCase(
        Get.find<GetExercisesByDayOfWeekRepository>()));
    Get.lazyPut(() => ManageIndividualWorkoutController(
        getExercisesByDayOfWeekUseCase: Get.find(),
        removeExerciseUseCase: Get.find()));
  }
}
