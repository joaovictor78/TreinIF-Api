import '/app/modules/manage_workouts_by_team/domain/i_repositories/i_get_all_exercises_by_day_of_week_repository.dart';
import '/app/core/utils/return_data.dart';

class GetAllExercisesByDayOfWeekUseCase {
  GetAllExercisesByDayOfWeekUseCase(
      this._iGetAllExercisesByDayOfWeekDataSource);
  final IGetAllExercisesByDayOfWeekRepository
      _iGetAllExercisesByDayOfWeekDataSource;
  Future<ReturnData> call(int workoutID, String dayOfWeek, int type) {
    return _iGetAllExercisesByDayOfWeekDataSource(workoutID, dayOfWeek, type);
  }
}
