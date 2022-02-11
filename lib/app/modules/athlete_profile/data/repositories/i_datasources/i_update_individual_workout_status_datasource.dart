import '/app/core/utils/return_data.dart';

abstract class IUpdateIndividualWorkoutStatusDataSource {
  Future<ReturnData> call(int athleteID, int workoutID);
}