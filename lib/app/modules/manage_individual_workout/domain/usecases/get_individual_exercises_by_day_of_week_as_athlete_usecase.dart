import '/app/core/utils/return_data.dart';
import '/app/domain/entitities/exercise_entity.dart';
import '/app/modules/manage_individual_workout/domain/i_repositories/i_get_individual_exercises_by_day_of_week_as_athlete_repository.dart';

class GetIndividualExercisesByDayOfWeekAsAthleteUseCase {
  GetIndividualExercisesByDayOfWeekAsAthleteUseCase(
      this._iGetIndividualExercisesByDayOfWeekAsAthleteRepository);
  final IGetIndividualExercisesByDayOfWeekAsAthleteRepository
      _iGetIndividualExercisesByDayOfWeekAsAthleteRepository;
  Future<ReturnData<List<ExerciseEntity>>> call(String dayOfWeek) {
    return _iGetIndividualExercisesByDayOfWeekAsAthleteRepository(dayOfWeek);
  }
}
