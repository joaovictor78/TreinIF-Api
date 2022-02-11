import '/app/modules/manage_workouts_by_team/data/repositories/i_datasources/i_get_all_exercises_by_day_of_week_datasource.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_workouts_by_team/domain/i_repositories/i_get_all_exercises_by_day_of_week_repository.dart';

class GetAllExercisesByDayOfWeekRepository
    implements IGetAllExercisesByDayOfWeekRepository {
  GetAllExercisesByDayOfWeekRepository(
      this._iGetAllExercisesByDayOfWeekDataSource);
  final IGetAllExercisesByDayOfWeekDataSource
      _iGetAllExercisesByDayOfWeekDataSource;
  @override
  Future<ReturnData> call(int workoutID, String dayOfWeek, int type) {
    return _iGetAllExercisesByDayOfWeekDataSource(workoutID, dayOfWeek, type);
  }
}
