import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '/app/modules/manage_individual_workout/controllers/manage_individual_workout_controller.dart';
import '/app/domain/entitities/exercise_type_entity.dart';
import '/app/modules/add_exercises_to_workout/domain/usecases/get_exercise_usecase.dart';
import '/app/core/components/custom_toast.dart';
import '/app/core/styles/app_colors.dart';
import '/app/domain/entitities/exercise_entity.dart';
import '/app/modules/add_exercises_to_workout/domain/usecases/add_exercise_usecase.dart';
import '/app/modules/manage_workouts_by_team/models/day_of_week_model.dart';

class AddExerciseController extends GetxController {
  AddExerciseController(
      {required this.addExerciseUseCase,
      required this.getExercisesTypesUseCase});
  var daysOfWeek = <Rx<DayOfWeekModel>>[
    DayOfWeekModel(name: "Segunda", key: "Monday", isActive: false).obs,
    DayOfWeekModel(name: "Terça", isActive: false).obs,
    DayOfWeekModel(name: "Quarta", isActive: false).obs,
    DayOfWeekModel(name: "Quinta", isActive: false).obs,
    DayOfWeekModel(name: "Sexta", isActive: false).obs,
    DayOfWeekModel(name: "Sabado", isActive: false).obs,
    DayOfWeekModel(name: "Domingo", isActive: false).obs
  ].obs;
  late TextEditingController seriesNumberTextController;
  late TextEditingController repeatTimeTextController;
  late TextEditingController exerciseVariationTextController;
  var exercisesTypes = <ExerciseTypeEntity>[].obs;
  String? dayOfWeekSelectedInTab = "Monday";
  var exerciseTypeSelected = Rxn<ExerciseTypeEntity>();
  AddExerciseUseCase addExerciseUseCase;
  GetExercisesTypesUseCase getExercisesTypesUseCase;
  ManageIndividualWorkoutController _manageIndividualWorkoutController =
      Get.find<ManageIndividualWorkoutController>();
  //ManageWorkoutController _manageWorkoutController =
  //  Get.find<ManageWorkoutController>();
  @override
  void onInit() {
    getExercisesTypes();
    dayOfWeekSelectedInTab = Get.parameters["day_of_week_selected_in_tab"];
    seriesNumberTextController = TextEditingController();
    repeatTimeTextController = TextEditingController();
    exerciseVariationTextController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    seriesNumberTextController.dispose();
    repeatTimeTextController.dispose();
    exerciseVariationTextController.dispose();
    super.onClose();
  }

  addExercise(int workoutID, int type) async {
    List<String>? daysOfWeekSelected = daysOfWeek
        .where((p0) => p0.value.isActive == true)
        .toList()
        .map((element) => element.value.key!)
        .toList();
    ExerciseEntity exercise = ExerciseEntity(
        exerciseType: exerciseTypeSelected.value,
        exerciseVariation: exerciseVariationTextController.text,
        repeatTimeInSeconds: int.parse(repeatTimeTextController.text),
        seriesNumber: int.parse(seriesNumberTextController.text),
        daysOfWeek: daysOfWeekSelected);
    final response = await addExerciseUseCase(workoutID, type, exercise);
    if (!response.success) {
      return CustomToast.showToast(
          "Ocorreu um erro ao adicionar o exercicio, tente novamente!",
          backgroundColor: AppColors.red);
    }
    //   _manageWorkoutController.getExercisesByDayOfWeek(
    //     workoutID, dayOfWeekSelectedInTab!);

    _manageIndividualWorkoutController.getExercisesByDayOfWeek(
        workoutID, dayOfWeekSelectedInTab!);
  }

  getExercisesTypes() async {
    final response = await getExercisesTypesUseCase();
    exercisesTypes.value = response.data;
  }
}
