import 'package:get/get.dart';
import 'package:treinif/app/modules/start/submodules/workouts/data/datasources/remotes/get_all_trainers_by_individual_workout_datasource.dart';
import 'package:treinif/app/modules/start/submodules/workouts/data/repositories/get_all_trainers_by_individual_workout_repository.dart';
import 'package:treinif/app/modules/start/submodules/workouts/domain/i_repositories/i_get_all_trainer_by_individual_workouts_repository.dart';
import 'package:treinif/app/modules/start/submodules/workouts/domain/usecases/get_all_trainer_by_individual_workouts_usecase.dart';
import '/app/modules/start/submodules/workouts/data/datasources/remotes/join_a_team_datasource.dart';
import '/app/modules/start/submodules/workouts/controllers/join_a_team_controller.dart';
import '/app/modules/start/submodules/workouts/data/repositories/join_a_team_repository.dart';
import '/app/modules/start/submodules/workouts/domain/usecases/join_a_team_usecase.dart';
import '/app/modules/start/submodules/workouts/data/datasources/remotes/create_team_datasource.dart';
import '/app/modules/start/submodules/workouts/data/repositories/create_team_repository.dart';
import '/app/modules/start/submodules/workouts/domain/usecases/create_team_usecase.dart';
import '/app/modules/start/submodules/workouts/controllers/create_team_controller.dart';
import '/app/modules/start/submodules/workouts/data/datasources/remotes/generate_code_to_workout_datasource.dart';
import '/app/modules/start/submodules/workouts/data/datasources/remotes/get_all_modalities_datasource.dart';
import '/app/modules/start/submodules/workouts/data/repositories/generate_code_to_workout_repository.dart';
import '/app/modules/start/submodules/workouts/data/repositories/get_all_modalities_repository.dart';
import '/app/modules/start/submodules/workouts/domain/usecases/generate_code_to_workout_usecase.dart';
import '/app/modules/start/submodules/workouts/domain/usecases/get_all_modalities_usecase.dart';
import '/app/modules/start/submodules/home/domain/usecases/search_athletes_use_case.dart';
import '/app/core/network/custom_dio/custom_dio.dart';
import '/app/modules/start/submodules/workouts/data/datasources/remotes/get_all_atheltes_by_individual_workouts_datasource.dart';
import '/app/modules/start/submodules/workouts/data/datasources/remotes/get_all_teams_by_workouts_datasource.dart';
import '/app/modules/start/submodules/workouts/data/repositories/get_all_athletes_by_individual_workouts_repository.dart';
import '/app/modules/start/submodules/workouts/data/repositories/get_all_teams_by_workouts_repository.dart';
import '/app/modules/start/submodules/workouts/domain/usecases/get_all_athletes_by_individual_workouts_usecase.dart';
import '/app/modules/start/submodules/workouts/domain/usecases/get_all_teams_by_workouts_usecase.dart';
import '/app/modules/start/submodules/home/data/datasources/remote/search_athletes_datasource.dart';
import '/app/modules/start/submodules/home/data/repositories/search_athletes_repository.dart';
import '/app/modules/start/submodules/home/home_controller.dart';
import '/app/modules/start/submodules/workouts/controllers/workouts_controller.dart';
import '/app/modules/start/start_controller.dart';

class StartBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StartController());
    Get.lazyPut(() => SearchAthletesDataSource(Get.find<CustomDio>()));
    Get.lazyPut(
        () => SearchAthletesRepository(Get.find<SearchAthletesDataSource>()));
    Get.lazyPut(
        () => SearchAthletesUseCase(Get.find<SearchAthletesRepository>()));
    Get.lazyPut(() => HomeController(Get.find()));
    Get.lazyPut(() =>
        GetAllAthletesByIndividualWorkoutsDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => GetAllAthletesByIndividualWorkoutsRepository(
        Get.find<GetAllAthletesByIndividualWorkoutsDataSource>()));
    Get.lazyPut(() => GetAllAthletesByIndividualWorkoutsUseCase(
        Get.find<GetAllAthletesByIndividualWorkoutsRepository>()));
    Get.lazyPut(() => GetAllTeamsByWorkoutsDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => GetAllTeamsByWorkoutsRepository(
        Get.find<GetAllTeamsByWorkoutsDataSource>()));
    Get.lazyPut(() => GetAllTeamsByWorkoutsUseCase(
        Get.find<GetAllTeamsByWorkoutsRepository>()));

    Get.lazyPut(() =>
        GetAllTrainersByIndividualWorkoutDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => GetAllTrainersByIndividualWorkoutRepository(
        Get.find<GetAllTrainersByIndividualWorkoutDataSource>()));
    Get.lazyPut(() => GetAllTrainersByIndividualWorkoutsUseCase(
        Get.find<GetAllTrainersByIndividualWorkoutRepository>()));

    Get.lazyPut(() => WorkoutsController(
        getAllTeamsByWorkoutsUseCase: Get.find(),
        getAllTrainersByIndividualWorkoutsUseCase: Get.find(),
        getAllAthletesByIndividualWorkoutsUseCase: Get.find()));
    Get.lazyPut(() => GenerateCodeToWorkoutDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => GenerateCodeToWorkoutRepository(
        Get.find<GenerateCodeToWorkoutDataSource>()));
    Get.lazyPut(() => GenerateCodeToWorkoutUseCase(
        Get.find<GenerateCodeToWorkoutRepository>()));
    Get.lazyPut(() => GetAllModalitiesDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() =>
        GetAllModalitiesRepository(Get.find<GetAllModalitiesDataSource>()));
    Get.lazyPut(
        () => GetAllModalitiesUseCase(Get.find<GetAllModalitiesRepository>()));
    Get.lazyPut(() => CreateTeamDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => CreateTeamRepository(Get.find<CreateTeamDataSource>()));
    Get.lazyPut(() => CreateTeamUseCase(Get.find<CreateTeamRepository>()));
    Get.lazyPut(() => CreateTeamController(
        generateCodeToWorkoutUseCase: Get.find(),
        getAllModalitiesUseCase: Get.find(),
        createTeamUseCase: Get.find()));

    Get.lazyPut(() => JoinATeamDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => JoinATeamRepository(Get.find<JoinATeamDataSource>()));
    Get.lazyPut(() => JoinATeamUseCase(Get.find<JoinATeamRepository>()));
    Get.lazyPut(() => JoinATeamController(Get.find()));
  }
}
