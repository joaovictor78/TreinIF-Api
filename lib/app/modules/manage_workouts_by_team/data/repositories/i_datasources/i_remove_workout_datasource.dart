import '/app/core/utils/return_data.dart';

abstract class IRemoveWorkoutDataSource {
  Future<ReturnData> call(int teamID, int workoutID);
}
