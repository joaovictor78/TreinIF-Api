import '/app/domain/entitities/exercise_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_workouts_by_team/domain/i_repositories/i_get_all_team_exercises_by_day_of_week_as_athlete_repository.dart';

class GetAllTeamExercisesByDayOfWeekAsAthleteRepository
    implements IGetAllTeamExercisesByDayOfWeekAsAthleteRepository {
  @override
  Future<ReturnData<List<ExerciseEntity>>> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
