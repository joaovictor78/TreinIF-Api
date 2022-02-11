import 'package:get/get.dart';
import '/app/modules/add_exercises_to_workout/data/datasources/get_exercises_types_datasource.dart';
import '/app/modules/add_exercises_to_workout/data/repositories/get_exercises_types_repository.dart';
import '/app/modules/add_exercises_to_workout/domain/usecases/get_exercise_usecase.dart';
import '/app/core/network/custom_dio/custom_dio.dart';
import '/app/modules/add_exercises_to_workout/data/datasources/add_exercise_datasource.dart';
import '/app/modules/add_exercises_to_workout/data/repositories/add_exercise_repository.dart';
import '/app/modules/add_exercises_to_workout/domain/usecases/add_exercise_usecase.dart';
import '/app/modules/add_exercises_to_workout/controllers/add_exercise_controller.dart';

class AddExercisesToWorkoutBiding implements Bindings{
  @override
  void dependencies() {
     Get.lazyPut(() => AddExerciseDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => AddExerciseRepository(Get.find<AddExerciseDataSource>()));
    Get.lazyPut(() => AddExerciseUseCase(Get.find<AddExerciseRepository>()));
    Get.lazyPut(() => GetExercisesTypesDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => GetExercisesTypesRepository(Get.find<GetExercisesTypesDataSource>()));
    Get.lazyPut(() => GetExercisesTypesUseCase(Get.find<GetExercisesTypesRepository>()));
    Get.lazyPut(() => AddExerciseController(addExerciseUseCase: Get.find(), getExercisesTypesUseCase: Get.find()));
  }
}