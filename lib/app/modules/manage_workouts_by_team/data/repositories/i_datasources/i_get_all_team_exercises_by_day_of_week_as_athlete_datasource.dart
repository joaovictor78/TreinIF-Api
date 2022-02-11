import '/app/core/utils/return_data.dart';
import '/app/domain/entitities/exercise_entity.dart';

abstract class IGetAllTeamExercisesByDayOfWeekAsAthleteDataSource {
  Future<ReturnData<List<ExerciseEntity>>> call();
}
