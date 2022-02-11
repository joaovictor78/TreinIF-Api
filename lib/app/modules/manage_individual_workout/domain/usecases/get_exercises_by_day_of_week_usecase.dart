import '/app/core/utils/return_data.dart';
import '/app/modules/manage_individual_workout/domain/i_repositories/i_get_exercises_by_day_of_week_repository.dart';

class GetExercisesByDayOfWeekUseCase{
  IGetExercisesByDayOfWeekRepository _iGetExercisesByDayOfWeekRepository;
  GetExercisesByDayOfWeekUseCase(this._iGetExercisesByDayOfWeekRepository);
  Future<ReturnData> call(int workoutID, String dayOfWeek, int type) async {
    return await _iGetExercisesByDayOfWeekRepository(workoutID, dayOfWeek, type);
  }
}