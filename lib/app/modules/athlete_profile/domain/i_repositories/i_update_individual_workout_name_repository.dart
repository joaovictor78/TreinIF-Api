import '/app/core/utils/return_data.dart';

abstract class IUpdateIndividualWorkoutNameRepository{
  Future<ReturnData> call(int workoutID, String name);
}