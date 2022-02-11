import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/trainer_entity.dart';

abstract class IGetAllTrainersByIndividualWorkoutsRepository {
  Future<ReturnData<List<TrainerEntity>>> call();
}
