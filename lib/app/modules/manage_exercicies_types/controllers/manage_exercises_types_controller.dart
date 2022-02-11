import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/domain/entitities/exercise_type_entity.dart';
import '/app/core/components/custom_toast.dart';
import '/app/core/styles/app_colors.dart';
import '/app/modules/manage_exercicies_types/domain/usecases/add_exercise_type_usecase.dart';
import '/app/modules/manage_exercicies_types/domain/usecases/get_exercises_types_usecase.dart';
import '/app/modules/manage_exercicies_types/domain/usecases/remove_exercise_type_usecase.dart';
import '/app/modules/manage_exercicies_types/domain/usecases/update_exercise_type_usecase.dart';

class ManageExercisesTypesController extends GetxController {
  ManageExercisesTypesController(
      {required this.getExercisesTypesUseCase,
      required this.addExerciseTypeUseCase,
      required this.removeExerciseTypeUseCase,
      required this.updateExerciseTypeUseCase});
  TextEditingController? exerciseTypeTextConstroller;
  var exercisesTypes  = <ExerciseTypeEntity>[].obs;
  var isLoading = false.obs;
  GetExercisesTypesUseCase getExercisesTypesUseCase;
  AddExerciseTypeUseCase addExerciseTypeUseCase;
  UpdateExerciseTypeUseCase updateExerciseTypeUseCase;
  RemoveExerciseTypeUseCase removeExerciseTypeUseCase;
 

  @override 
  onInit(){
    getExercisesTypes();
    exerciseTypeTextConstroller = TextEditingController();
    super.onInit();
  }
  @override 
  onClose(){
    exerciseTypeTextConstroller!.dispose();
    super.onClose();
  }
  getExercisesTypes() async {
    isLoading.value = true;
    final response = await getExercisesTypesUseCase();
    isLoading.value = false;
    if (!response.success) {
      return CustomToast.showToast(
          "Ocorreu um erro ao pegar os tipos de exercicio",
          backgroundColor: AppColors.red);
    }
    exercisesTypes.value = response.data;
  }

  addExerciseType() async {
    String exerciseTypeName = exerciseTypeTextConstroller!.text;
    final response = await addExerciseTypeUseCase(exerciseTypeName);
    if (!response.success) {
      return CustomToast.showToast(
          "Ocorreu um erro ao adicionar o tipo de exercicio",
          backgroundColor: AppColors.red);
    }
    exercisesTypes.add(response.data);

  }

  updateExerciseType(int id) async {
     String exerciseTypeName = exerciseTypeTextConstroller!.text;
    final response = await updateExerciseTypeUseCase(id, exerciseTypeName);
    if(!response.success) {
      return CustomToast.showToast("Ocorreu um erro ao atualizar o tipo de exercicio!", backgroundColor: AppColors.red);
    }
    ExerciseTypeEntity exerciseType =  exercisesTypes.firstWhere((element) => element.id == id);
    exerciseType.name = exerciseTypeName;
  }

  removeExerciseType(int id) async {
    final response = await removeExerciseTypeUseCase(id);
     if(!response.success) {
      return CustomToast.showToast("Ocorreu um erro ao remover o tipo de exercicio!", backgroundColor: AppColors.red);
    }
    exercisesTypes.removeWhere((element) => element.id == id);
    return CustomToast.showToast("Tipo de Exercicio removido com sucesso!", backgroundColor: AppColors.green);
  }
}
