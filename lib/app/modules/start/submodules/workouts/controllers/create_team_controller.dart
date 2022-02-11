import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/modules/start/submodules/workouts/controllers/workouts_controller.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/team_entity.dart';
import '/app/modules/start/submodules/workouts/domain/usecases/create_team_usecase.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/modality_entity.dart';
import '/app/core/components/custom_toast.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/code_entitiy.dart';
import '/app/modules/start/submodules/workouts/domain/usecases/get_all_modalities_usecase.dart';
import '/app/modules/start/submodules/workouts/domain/usecases/generate_code_to_workout_usecase.dart';

class CreateTeamController extends GetxController {
  CreateTeamController({required this.generateCodeToWorkoutUseCase, required this.getAllModalitiesUseCase, required this.createTeamUseCase});
  GenerateCodeToWorkoutUseCase generateCodeToWorkoutUseCase;
  GetAllModalitiesUseCase getAllModalitiesUseCase;
  CreateTeamUseCase createTeamUseCase;
  TextEditingController teamDescriptionController = TextEditingController();
  TextEditingController teamNameController = TextEditingController();
  WorkoutsController _workoutsController = Get.find();
  @override
  void onInit() { 
    generateCode();
    getAllModalities();
    super.onInit();
  }

  final code = CodeEntity().obs;
  final modalities = <ModalityEntity>[].obs;
  final modality = ModalityEntity().obs;
  final loading = false.obs;
  generateCode() async { 
    final response = await generateCodeToWorkoutUseCase();
    if(!response.success){
      return CustomToast.showToast("Ocorreu um erro ao gerar o codigo", backgroundColor: Colors.red);
    }
    code.value = response.data!;
  }
  getAllModalities() async {
    final response = await getAllModalitiesUseCase();
    if(!response.success){
      return CustomToast.showToast("Ocorreu um erro ao pegar as modalidades", backgroundColor: Colors.red);
    }
    modalities.value = response.data!;
  }
  set modality(value) => modality.value = value;
  createTeam() async {
    String name = teamNameController.text;
    String description = teamDescriptionController.text;
    final response = await createTeamUseCase(TeamEntity(name: name, description: description, code: code.value, modality: modality.value));
    if(!response.success){
      return CustomToast.showToast("Ocorreu um erro ao criar a equipe", backgroundColor: Colors.red);
    }
    _workoutsController.teamsByWorkouts.add(response.data);
    Get.back();
  }
}