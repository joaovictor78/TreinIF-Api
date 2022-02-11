import '/app/core/utils/return_data.dart';

abstract class IUpdateWorkoutStatusDataSource {
  Future<ReturnData> call(int teamID, int workoutID);
}
