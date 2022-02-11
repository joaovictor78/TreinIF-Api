import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/trainer_entity.dart';
import '/app/modules/start/submodules/workouts/domain/i_repositories/i_get_all_trainer_by_individual_workouts_repository.dart';
import '/app/modules/start/submodules/workouts/data/repositories/i_datasourses/i_get_all_trainers_by_individual_workout_datasource.dart';

class GetAllTrainersByIndividualWorkoutRepository
    implements IGetAllTrainersByIndividualWorkoutsRepository {
  GetAllTrainersByIndividualWorkoutRepository(
      this._iGetAllTrainersByIndividualWorkoutDataSource);
  final IGetAllTrainersByIndividualWorkoutDataSource
      _iGetAllTrainersByIndividualWorkoutDataSource;

  @override
  Future<ReturnData<List<TrainerEntity>>> call() async {
    return await _iGetAllTrainersByIndividualWorkoutDataSource();
  }
}
