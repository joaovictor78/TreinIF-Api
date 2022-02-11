import '/app/core/utils/return_data.dart';

abstract class IUpdateWorkoutNameRepository {
  Future<ReturnData> call(int teamID, int workoutID, String name);
}
