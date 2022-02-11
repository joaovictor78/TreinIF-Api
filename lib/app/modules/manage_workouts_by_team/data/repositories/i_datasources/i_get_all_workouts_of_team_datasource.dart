import '/app/core/utils/return_data.dart';
import '/app/domain/entitities/workout_entity.dart';

abstract class IGetAllWorkoutsOfTeamDataSource {
  Future<ReturnData<List<WorkoutEntity>>> call(int teamId);
}
