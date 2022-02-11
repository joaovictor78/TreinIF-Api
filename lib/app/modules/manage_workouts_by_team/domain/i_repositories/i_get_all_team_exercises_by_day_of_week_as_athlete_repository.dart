import '/app/domain/entitities/exercise_entity.dart';
import '/app/core/utils/return_data.dart';

abstract class IGetAllTeamExercisesByDayOfWeekAsAthleteRepository {
  Future<ReturnData<List<ExerciseEntity>>> call(int teamID, String dayOfWeek);
}
