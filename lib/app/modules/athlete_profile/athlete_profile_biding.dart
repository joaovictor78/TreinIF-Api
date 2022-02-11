import 'package:get/get.dart';
import '/app/modules/athlete_profile/data/datasources/remove_value_data_point_of_historic_of_athlete_datasource.dart';
import '/app/modules/athlete_profile/data/repositories/remove_value_data_point_of_historic_of_athlete_repository.dart';
import '/app/modules/athlete_profile/domain/usecases/remove_value_data_point_of_historic_of_athlete_usecase.dart';
import '/app/modules/athlete_profile/data/datasources/update_value_data_point_of_historic_of_athlete_datasource.dart';
import '/app/modules/athlete_profile/data/repositories/update_value_data_point_of_historic_of_athlete_repository.dart';
import '/app/modules/athlete_profile/data/datasources/add_individual_workout_datasource.dart';
import '/app/modules/athlete_profile/data/repositories/add_individual_workout_repository.dart';
import '/app/modules/athlete_profile/domain/usecases/add_individual_workout_usecase.dart';
import '/app/modules/athlete_profile/domain/usecases/update_value_data_point_of_historic_of_athlete_usecase.dart';
import '/app/modules/athlete_profile/data/datasources/remove_individual_workout_datasource.dart';
import '/app/modules/athlete_profile/data/repositories/remove_individual_workout_repository.dart';
import '/app/modules/athlete_profile/domain/usecases/remove_individual_workout_usecase.dart';
import '/app/modules/athlete_profile/data/datasources/remove_data_point_of_historic_of_athlete_datasource.dart';
import '/app/modules/athlete_profile/data/datasources/update_date_data_point_of_historic_of_athlete_datasource.dart';
import '/app/modules/athlete_profile/data/datasources/update_individual_workout_status_datasource.dart';
import '/app/modules/athlete_profile/data/datasources/update_workout_name_datasource.dart';
import '/app/modules/athlete_profile/data/repositories/remove_data_point_of_historic_of_athlete_repository.dart';
import '/app/modules/athlete_profile/data/repositories/update_date_data_point_of_historic_of_athlete_repository.dart';
import '/app/modules/athlete_profile/data/repositories/update_individual_workout_name_repository.dart';
import '/app/modules/athlete_profile/data/repositories/update_individual_workout_status_repository.dart';
import '/app/modules/athlete_profile/domain/usecases/remove_data_point_of_historic_of_athlete_usecase.dart';
import '/app/modules/athlete_profile/domain/usecases/update_date_data_point_of_historic_of_athlete_usecase.dart';
import '/app/modules/athlete_profile/domain/usecases/update_individual_workout_name_usecase.dart';
import '/app/modules/athlete_profile/domain/usecases/update_individual_workout_status_usecase.dart';
import '/app/modules/athlete_profile/domain/usecases/get_all_individual_workouts_of_athlete_usecase.dart';
import '/app/modules/athlete_profile/data/datasources/get_all_individual_workouts_datasource.dart';
import '/app/modules/athlete_profile/data/repositories/get_all_individual_workouts_repository.dart';
import '/app/modules/athlete_profile/controllers/historic_of_athlete_controller.dart';
import '/app/modules/athlete_profile/data/datasources/add_value_data_point_of_historic_of_athlete_datasource.dart';
import '/app/modules/athlete_profile/data/repositories/add_value_data_point_of_historic_of_athlete_repository.dart';
import '/app/modules/athlete_profile/domain/usecases/add_value_data_point_of_historic_of_athlete_usecase.dart';
import '/app/core/network/custom_dio/custom_dio.dart';
import '/app/modules/athlete_profile/data/datasources/add_historic_of_athlete_datasource.dart';
import '/app/modules/athlete_profile/data/repositories/add_historic_of_athlete_repository.dart';
import '/app/modules/athlete_profile/domain/usecases/add_historic_of_athlete_usecase.dart';
import "/app/modules/athlete_profile/data/datasources/get_athlete's_history_datasource.dart";
import "/app/modules/athlete_profile/data/repositories/get_athlete's_history_usecase.dart";
import "/app/modules/athlete_profile/domain/usecases/get_athlete's_history_usecase.dart";
import '/app/modules/athlete_profile/controllers/athlete_profile_controller.dart';

class AthleteProfileBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetAthletesHistoryDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() =>
        GetAthletesHistoryRepository(Get.find<GetAthletesHistoryDataSource>()));
    Get.lazyPut(() =>
        GetAthletesHistoryUseCase(Get.find<GetAthletesHistoryRepository>()));

    Get.lazyPut(() => AddHistoricOfAthleteDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => AddHistoricOfAthleteRepository(
        Get.find<AddHistoricOfAthleteDataSource>()));
    Get.lazyPut(() => AddHistoricOfAthleteUseCase(
        Get.find<AddHistoricOfAthleteRepository>()));

    Get.lazyPut(() => AddIndividualWorkoutDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => AddIndividualWorkoutRepository(
        Get.find<AddIndividualWorkoutDataSource>()));
    Get.lazyPut(() => AddIndividualWorkoutUseCase(
        Get.find<AddIndividualWorkoutRepository>()));

    Get.lazyPut(
        () => GetAllIndividualWorkoutsDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => GetAllIndividualWorkoutsRepository(
        Get.find<GetAllIndividualWorkoutsDataSource>()));
    Get.lazyPut(() => GetAllIndividualWorkoutsOfAthleteUseCase(
        Get.find<GetAllIndividualWorkoutsRepository>()));

    Get.lazyPut(
        () => GetAllIndividualWorkoutsDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => GetAllIndividualWorkoutsRepository(
        Get.find<GetAllIndividualWorkoutsDataSource>()));
    Get.lazyPut(() => GetAllIndividualWorkoutsOfAthleteUseCase(
        Get.find<GetAllIndividualWorkoutsRepository>()));

    Get.lazyPut(() => UpdateDateDataPointOfHistoricOfAthleteDataSource(
        Get.find<CustomDio>()));
    Get.lazyPut(() => UpdateDateDataPointOfHistoricOfAthleteRepository(
        Get.find<UpdateDateDataPointOfHistoricOfAthleteDataSource>()));
    Get.lazyPut(() => UpdateDateDataPointOfHistoricOfAthleteUseCase(
        Get.find<UpdateDateDataPointOfHistoricOfAthleteRepository>()));

    Get.lazyPut(
        () => UpdateIndividualWorkoutNameDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => UpdateIndividualWorkoutNameRepository(
        Get.find<UpdateIndividualWorkoutNameDataSource>()));
    Get.lazyPut(() => UpdateIndividualWorkoutNameUseCase(
        Get.find<UpdateIndividualWorkoutNameRepository>()));

    Get.lazyPut(
        () => UpdateIndividualWorkoutStatusDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => UpdateIndividualWorkoutStatusRepository(
        Get.find<UpdateIndividualWorkoutStatusDataSource>()));
    Get.lazyPut(() => UpdateIndividualWorkoutStatusUseCase(
        Get.find<UpdateIndividualWorkoutStatusRepository>()));

    Get.lazyPut(() =>
        RemoveDataPointOfHistoricOfAthleteDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => RemoveDataPointOfHistoricOfAthleteRepository(
        Get.find<RemoveDataPointOfHistoricOfAthleteDataSource>()));
    Get.lazyPut(() => RemoveDataPointOfHistoricOfAthleteUseCase(
        Get.find<RemoveDataPointOfHistoricOfAthleteRepository>()));

    Get.lazyPut(() => RemoveIndividualWorkoutDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => RemoveIndividualWorkoutRepository(
        Get.find<RemoveIndividualWorkoutDataSource>()));
    Get.lazyPut(() => RemoveIndividualWorkoutUseCase(
        Get.find<RemoveIndividualWorkoutRepository>()));

    Get.lazyPut(() => AthleteProfileController(
        getAthletesHistoryUseCase: Get.find(),
        getAllAthleteWorkoutsUseCase: Get.find(),
        addIndividualWorkoutUseCase: Get.find(),
        addHistoricOfAthleteUseCase: Get.find(),
        updateDateDataPointOfHistoricOfAthleteUseCase: Get.find(),
        updateIndividualWorkoutNameUseCase: Get.find(),
        updateIndividualWorkoutStatusUseCase: Get.find(),
        removeDataPointOfHistoricOfAthleteDataSource: Get.find(),
        removeIndividualWorkoutUseCase: Get.find()));

    Get.lazyPut(() =>
        AddValueDataPointOfHistoricOfAthleteDataSource(Get.find<CustomDio>()));
    Get.lazyPut(() => AddValueDataPointOfHistoricOfAthleteRepository(
        Get.find<AddValueDataPointOfHistoricOfAthleteDataSource>()));
    Get.lazyPut(() => AddValueDataPointOfHistoricOfAthleteUseCase(
        Get.find<AddValueDataPointOfHistoricOfAthleteRepository>()));

    Get.lazyPut(() => UpdateValueDataPointOfHistoricOfAthleteDataSource(
        Get.find<CustomDio>()));
    Get.lazyPut(() => UpdateValueDataPointOfHistoricOfAthleteRepository(
        Get.find<UpdateValueDataPointOfHistoricOfAthleteDataSource>()));
    Get.lazyPut(() => UpdateValueDataPointOfHistoricOfAthleteUseCase(
        Get.find<UpdateValueDataPointOfHistoricOfAthleteRepository>()));

    Get.lazyPut(() => RemoveValueDataPointOfHistoricOfAthleteDataSource(
        Get.find<CustomDio>()));
    Get.lazyPut(() => RemoveValueDataPointOfHistoricOfAthleteRepository(
        Get.find<RemoveValueDataPointOfHistoricOfAthleteDataSource>()));
    Get.lazyPut(() => RemoveValueDataPointOfHistoricOfAthleteUseCase(
        Get.find<RemoveValueDataPointOfHistoricOfAthleteRepository>()));

    Get.lazyPut(() => HistoricOfAthleteController(
        addValueDataPointOfHistoricOfAthleteUseCase: Get.find(),
        updateValueDataPointOfHistoricOfAthleteUseCase: Get.find(),
        removeValueDataPointOfHistoricOfAthleteUseCase: Get.find()));
  }
}
