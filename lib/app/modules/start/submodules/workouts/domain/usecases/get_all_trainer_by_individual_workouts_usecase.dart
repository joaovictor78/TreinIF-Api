import '/app/modules/start/submodules/workouts/domain/i_repositories/i_get_all_trainer_by_individual_workouts_repository.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/trainer_entity.dart';

class GetAllTrainersByIndividualWorkoutsUseCase {
  GetAllTrainersByIndividualWorkoutsUseCase(
      this._iGetAllTrainerByIndividualWorkoutsRepository);
  final IGetAllTrainersByIndividualWorkoutsRepository
      _iGetAllTrainerByIndividualWorkoutsRepository;
  Future<ReturnData<List<TrainerEntity>>> call() {
    return _iGetAllTrainerByIndividualWorkoutsRepository();
  }
}
