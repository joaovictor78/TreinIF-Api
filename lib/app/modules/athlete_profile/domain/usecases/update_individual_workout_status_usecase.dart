import '/app/core/utils/return_data.dart';
import '../i_repositories/i_update_individual_workout_status_repository.dart';

class UpdateIndividualWorkoutStatusUseCase{ 
  IUpdateIndividualWorkoutStatusRepository _iUpdateWorkoutStatusRepository;
  UpdateIndividualWorkoutStatusUseCase(this._iUpdateWorkoutStatusRepository);
  
  Future<ReturnData> call(int athleteID, int workoutID) async {
    return await _iUpdateWorkoutStatusRepository(athleteID, workoutID);
  }
}