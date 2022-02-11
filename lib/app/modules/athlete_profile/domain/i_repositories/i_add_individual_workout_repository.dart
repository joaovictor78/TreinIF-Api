import '/app/core/utils/return_data.dart';
import '/app/domain/entitities/individual_workout_entity.dart';

abstract class IAddIndividualWorkoutRepository{
   Future<ReturnData<IndividualWorkoutEntity>> call(int athleteID, String? workoutName);
}