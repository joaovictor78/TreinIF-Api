import '/app/modules/athlete_profile/domain/i_repositories/i_remove_individual_workout_repository.dart';
import '/app/core/utils/return_data.dart';

class RemoveIndividualWorkoutUseCase{
  IRemoveIndividualWorkoutRepository _iRemoveIndividualWorkoutRepository;
  RemoveIndividualWorkoutUseCase(this._iRemoveIndividualWorkoutRepository);
  Future<ReturnData> call(int individualWorkout) async {
    return await _iRemoveIndividualWorkoutRepository(individualWorkout);
  }
}