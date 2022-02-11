import '/app/core/utils/return_data.dart';

abstract class IRemoveIndividualWorkoutRepository{
  Future<ReturnData> call(int individualWorkout);
}