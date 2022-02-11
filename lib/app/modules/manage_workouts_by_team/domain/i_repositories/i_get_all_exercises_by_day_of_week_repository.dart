import '/app/core/utils/return_data.dart';

abstract class IGetAllExercisesByDayOfWeekRepository {
  Future<ReturnData> call(int workoutID, String dayOfWeek, int type);
}
