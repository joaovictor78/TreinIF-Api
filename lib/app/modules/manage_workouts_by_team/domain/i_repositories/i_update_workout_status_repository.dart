import '/app/core/utils/return_data.dart';

abstract class IUpdateWorkoutStatusRepository {
  Future<ReturnData> call(int teamID, int workoutID);
}
