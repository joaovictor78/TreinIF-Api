import '/app/core/utils/return_data.dart';
import '/app/domain/entitities/exercise_entity.dart';

abstract class IGetIndividualExercisesByDayOfWeekAsAthleteRepository {
  Future<ReturnData<List<ExerciseEntity>>> call(String dayOfWeek);
}
