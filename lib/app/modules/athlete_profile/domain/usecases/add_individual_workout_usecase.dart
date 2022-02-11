import '/app/domain/entitities/individual_workout_entity.dart';

import '/app/modules/athlete_profile/domain/i_repositories/i_add_individual_workout_repository.dart';
import '/app/core/utils/return_data.dart';

class AddIndividualWorkoutUseCase {
  IAddIndividualWorkoutRepository _iAddIndividualWorkoutRepository;
  AddIndividualWorkoutUseCase(this._iAddIndividualWorkoutRepository);
  Future<ReturnData<IndividualWorkoutEntity>> call(
      int athleteID, String? workoutName) async {
    return _iAddIndividualWorkoutRepository(athleteID, workoutName);
  }
}
