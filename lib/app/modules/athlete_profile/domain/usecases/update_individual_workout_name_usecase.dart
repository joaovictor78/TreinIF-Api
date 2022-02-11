import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/domain/i_repositories/i_update_individual_workout_name_repository.dart';

class UpdateIndividualWorkoutNameUseCase{
  IUpdateIndividualWorkoutNameRepository _iUpdateIndividualWorkoutNameRepository;
  UpdateIndividualWorkoutNameUseCase(this._iUpdateIndividualWorkoutNameRepository);

  Future<ReturnData> call(int workoutID, String name) async {
    return await _iUpdateIndividualWorkoutNameRepository(workoutID, name);
  }
}