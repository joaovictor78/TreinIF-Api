import '/app/core/utils/return_data.dart';

abstract class IRemoveWorkoutRepository {
  Future<ReturnData> call(int teamID, int workoutID);
}
