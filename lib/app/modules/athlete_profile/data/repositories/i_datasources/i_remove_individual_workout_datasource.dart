import '/app/core/utils/return_data.dart';

abstract class IRemoveIndividualWorkoutDataSource {
  Future<ReturnData> call(int individualWorkout);
}
