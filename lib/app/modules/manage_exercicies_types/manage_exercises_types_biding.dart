import 'package:get/get.dart';
import '/app/modules/manage_exercicies_types/data/datasources/remove_exercise_type_datasource.dart';
import '/app/modules/manage_exercicies_types/data/repositories/remove_exercise_type_repository.dart';
import '/app/modules/manage_exercicies_types/domain/usecases/remove_exercise_type_usecase.dart';
import '/app/modules/manage_exercicies_types/data/datasources/add_exercise_type_datasource.dart';
import '/app/modules/manage_exercicies_types/data/datasources/update_exercise_type_datasource.dart';
import '/app/modules/manage_exercicies_types/data/repositories/update_exercise_type_repository.dart';
import '/app/modules/manage_exercicies_types/domain/usecases/update_exercise_type_usecase.dart';
import '/app/modules/manage_exercicies_types/data/repositories/add_exercise_type_repository.dart';
import '/app/modules/manage_exercicies_types/domain/usecases/add_exercise_type_usecase.dart';
import '/app/core/network/custom_dio/custom_dio.dart';
import '/app/modules/manage_exercicies_types/data/datasources/get_exercises_type_datasource.dart';
import '/app/modules/manage_exercicies_types/data/repositories/get_exercises_type_repository.dart';
import '/app/modules/manage_exercicies_types/domain/usecases/get_exercises_types_usecase.dart';
import '/app/modules/manage_exercicies_types/controllers/manage_exercises_types_controller.dart';

class ManageExercisesTypesBiding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => GetExercisesTypeDataSource(Get.find<CustomDio>()));
   Get.lazyPut(() => GetExercisesTypeRepository(Get.find<GetExercisesTypeDataSource>()));
   Get.lazyPut(() => GetExercisesTypesUseCase(Get.find<GetExercisesTypeRepository>()));
   
   Get.lazyPut(() => AddExerciseTypeDataSource(Get.find<CustomDio>()));
   Get.lazyPut(() => AddExerciseTypeRepository(Get.find<AddExerciseTypeDataSource>()));
   Get.lazyPut(() => AddExerciseTypeUseCase(Get.find<AddExerciseTypeRepository>()));
   
   Get.lazyPut(() => UpdateExerciseTypeDataSource(Get.find<CustomDio>()));
   Get.lazyPut(() => UpdateExerciseTypeRepository(Get.find<UpdateExerciseTypeDataSource>()));
   Get.lazyPut(() => UpdateExerciseTypeUseCase(Get.find<UpdateExerciseTypeRepository>()));
   
   Get.lazyPut(() => RemoveExerciseTypeDataSource(Get.find<CustomDio>())); 
   Get.lazyPut(() => RemoveExerciseTypeRepository(Get.find<RemoveExerciseTypeDataSource>()));
   Get.lazyPut(() => RemoveExerciseTypeUseCase(Get.find<RemoveExerciseTypeRepository>()));
 
   Get.lazyPut(() => ManageExercisesTypesController(getExercisesTypesUseCase: Get.find(), addExerciseTypeUseCase: Get.find(), updateExerciseTypeUseCase: Get.find(), removeExerciseTypeUseCase: Get.find()));
  }

}