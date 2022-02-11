import '/app/core/utils/return_data.dart';

abstract class IUpdateIndividualWorkoutNameDataSource{
  Future<ReturnData> call(int workoutID, String name);
}