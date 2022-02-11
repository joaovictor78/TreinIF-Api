import '/app/domain/entitities/exercise_entity.dart';
import '/app/core/utils/return_data.dart';

abstract class IGetExercisesByDayOfWeekRepository{
    Future<ReturnData<List<ExerciseEntity>>> call(int workoutID, String dayOfWeek, int type);
}