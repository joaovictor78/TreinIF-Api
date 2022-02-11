import '/app/modules/manage_individual_workout/data/repositories/i_datasources/i_get_individual_exercises_by_day_of_week_as_athlete_datasource.dart';
import '/app/domain/entitities/exercise_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_individual_workout/domain/i_repositories/i_get_individual_exercises_by_day_of_week_as_athlete_repository.dart';

class GetIndividualExercisesByDayOfWeekAsAthleteRepository
    implements IGetIndividualExercisesByDayOfWeekAsAthleteRepository {
  GetIndividualExercisesByDayOfWeekAsAthleteRepository(
      this._iGetIndividualExercisesByDayOfWeekAsAthleteDataSource);
  final IGetIndividualExercisesByDayOfWeekAsAthleteDataSource
      _iGetIndividualExercisesByDayOfWeekAsAthleteDataSource;
  @override
  Future<ReturnData<List<ExerciseEntity>>> call(String dayOfWeek) {
    return _iGetIndividualExercisesByDayOfWeekAsAthleteDataSource(dayOfWeek);
  }
}
