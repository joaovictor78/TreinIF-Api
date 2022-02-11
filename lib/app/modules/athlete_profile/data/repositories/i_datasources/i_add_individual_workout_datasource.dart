import '/app/domain/entitities/individual_workout_entity.dart';
import '/app/core/utils/return_data.dart';

abstract class IAddIndividualWorkoutDataSource{
  Future<ReturnData<IndividualWorkoutEntity>> call(int athleteID, String? workoutName);
}