import '/app/core/utils/return_data.dart';

abstract class IUpdateIndividualWorkoutStatusRepository{
  Future<ReturnData> call(int athleteID, int workoutID);
}