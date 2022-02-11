import '/app/core/utils/return_data.dart';

abstract class IGetAllExercisesByDayOfWeekDataSource {
  Future<ReturnData> call(int workoutID, String dayOfWeek, int type);
}
