import 'package:get/get.dart';
import '/app/modules/manage_workouts_by_team/data/datasources/remotes/get_all_team_exercises_by_day_of_week_as_athlete_datasource.dart';
import '/app/modules/manage_workouts_by_team/data/repositories/get_all_team_exercises_by_day_of_week_as_athlete_repository.dart';
import '/app/modules/manage_workouts_by_team/domain/usecases/get_all_team_exercises_by_day_of_week_as_athlete_usecase.dart';
import '/app/modules/manage_workouts_by_team/data/datasources/remotes/get_all_athletes_of_team_datasource.dart';
import '/app/modules/manage_workouts_by_team/data/repositories/get_all_athletes_of_team_repository.dart';
import '/app/modules/manage_workouts_by_team/domain/usecases/get_all_athletes_of_team_usecase.dart';
import '/app/modules/manage_workouts_by_team/data/datasources/remotes/get_all_exercises_by_day_of_week.dart';
import '/app/modules/manage_workouts_by_team/data/repositories/get_all_exercises_by_day_of_week_repository.dart';
import '/app/modules/manage_workouts_by_team/domain/usecases/get_all_exercises_by_day_of_week_usecase.dart';
import '/app/modules/manage_workouts_by_team/data/datasources/remotes/remove_workout_datasource.dart';
import '/app/modules/manage_workouts_by_team/data/repositories/remove_workout_repository.dart';
import '/app/modules/manage_workouts_by_team/domain/usecases/remove_workout_usecase.dart';
import '/app/modules/manage_workouts_by_team/data/datasources/remotes/update_workout_name_datasource.dart';
import '/app/modules/manage_workouts_by_team/data/datasources/remotes/update_workout_status_datasource.dart';
import '/app/modules/manage_workouts_by_team/data/repositories/update_workout_name_repository.dart';
import '/app/modules/manage_workouts_by_team/data/repositories/update_workout_status_repository.dart';
import '/app/modules/manage_workouts_by_team/domain/usecases/update_workout_name_usecase.dart';
import '/app/modules/manage_workouts_by_team/domain/usecases/update_workout_status_usecase.dart';
import '/app/modules/manage_workouts_by_team/data/datasources/remotes/create_workout_datasource.dart';
import '/app/modules/manage_workouts_by_team/data/repositories/create_workout_repository.dart';
import '/app/modules/manage_workouts_by_team/domain/usecases/create_workout_usecase.dart';
import '/app/core/network/custom_dio/custom_dio.dart';
import '/app/modules/manage_workouts_by_team/controllers/list_workouts_by_team_controller.dart';
import '/app/modules/manage_workouts_by_team/data/datasources/remotes/get_all_workouts_of_team_datasource.dart';
import '/app/modules/manage_workouts_by_team/data/repositories/get_all_workouts_of_team_repository.dart';
import '/app/modules/manage_workouts_by_team/domain/usecases/get_all_workouts_of_team_usecase.dart';
import '/app/modules/manage_workouts_by_team/controllers/manage_workout_controller.dart';

class ManageWorkoutsByTeamBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetAllWorkoutsOfTeamDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => GetAllWorkoutsOfTeamRepository(
        Get.find<GetAllWorkoutsOfTeamDataSource>()));
    Get.lazyPut(() => GetAllWorkoutsOfTeamUseCase(
        Get.find<GetAllWorkoutsOfTeamRepository>()));

    Get.lazyPut(() => CreateWorkoutDataSource(Get.find<CustomDio>()));
    Get.lazyPut(
        () => CreateWorkoutRepository(Get.find<CreateWorkoutDataSource>()));
    Get.lazyPut(
        () => CreateWorkoutUseCase(Get.find<CreateWorkoutRepository>()));

    Get.lazyPut(() => UpdateWorkoutNameDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() =>
        UpdateWorkoutNameRepository(Get.find<UpdateWorkoutNameDataSource>()));
    Get.lazyPut(() =>
        UpdateWorkoutNameUseCase(Get.find<UpdateWorkoutNameRepository>()));

    Get.lazyPut(() => UpdateWorkoutStatusDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => UpdateWorkoutStatusRepository(
        Get.find<UpdateWorkoutStatusDataSource>()));
    Get.lazyPut(() =>
        UpdateWorkoutStatusUseCase(Get.find<UpdateWorkoutStatusRepository>()));

    Get.lazyPut(() => RemoveWorkoutDataSource(Get.find<CustomDio>()));
    Get.lazyPut(
        () => RemoveWorkoutRepository(Get.find<RemoveWorkoutDataSource>()));
    Get.lazyPut(
        () => RemoveWorkoutUseCase(Get.find<RemoveWorkoutRepository>()));

    Get.lazyPut(() => ListWorkoutsOfTeamController(
        getAllWorkoutsOfTeamUseCase: Get.find(),
        createWorkoutUseCase: Get.find(),
        updateWorkoutNameUseCase: Get.find(),
        updateWorkoutStatusUseCase: Get.find(),
        removeWorkoutUseCase: Get.find()));

    Get.lazyPut(
        () => GetAllExercisesByDayOfWeekDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => GetAllExercisesByDayOfWeekRepository(
        Get.find<GetAllExercisesByDayOfWeekDataSource>()));
    Get.lazyPut(() => GetAllExercisesByDayOfWeekUseCase(
        Get.find<GetAllExercisesByDayOfWeekRepository>()));

    Get.lazyPut(() => GetAllAthletesOfTeamDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => GetAllAthletesOfTeamRepository(
        Get.find<GetAllAthletesOfTeamDataSource>()));
    Get.lazyPut(() => GetAllAthletesOfTeamUseCase(
        Get.find<GetAllAthletesOfTeamRepository>()));

    Get.lazyPut(() => GetAllTeamExercisesByDayOfWeekAsAthleteDataSource(
        Get.find<CustomDio>()));
    Get.lazyPut(() => GetAllTeamExercisesByDayOfWeekAsAthleteRepository(
        Get.find<GetAllTeamExercisesByDayOfWeekAsAthleteDataSource>()));
    Get.lazyPut(() => GetAllTeamExercisesByDayOfWeekAsAthleteUseCase(
        Get.find<GetAllTeamExercisesByDayOfWeekAsAthleteRepository>()));
    Get.lazyPut(
        () => ManageWorkoutController(Get.find(), Get.find(), Get.find()));
  }
}
