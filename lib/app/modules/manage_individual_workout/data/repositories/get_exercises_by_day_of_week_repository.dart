import '/app/modules/manage_individual_workout/data/repositories/i_datasources/i_get_exercises_by_day_of_week_datasource.dart';
import '/app/domain/entitities/exercise_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_individual_workout/domain/i_repositories/i_get_exercises_by_day_of_week_repository.dart';

class GetExercisesByDayOfWeekRepository implements IGetExercisesByDayOfWeekRepository{
  IGetExercisesByDayOfWeekDataSource _iGetExercisesByDayOfWeekDataSource;
  GetExercisesByDayOfWeekRepository(this._iGetExercisesByDayOfWeekDataSource);
  @override
  Future<ReturnData<List<ExerciseEntity>>> call(int workoutID, String dayOfWeek, int type) async {
      return await _iGetExercisesByDayOfWeekDataSource(workoutID, dayOfWeek, type);
  }

}