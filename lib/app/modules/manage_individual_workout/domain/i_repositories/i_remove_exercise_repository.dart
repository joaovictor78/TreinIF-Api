import '/app/core/utils/return_data.dart';

abstract class IRemoveExerciseRepository{
  Future<ReturnData> call(int workoutID, int exerciseID);
}