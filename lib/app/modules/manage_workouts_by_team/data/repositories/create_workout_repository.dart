import '/app/modules/manage_workouts_by_team/data/repositories/i_datasources/i_create_workout_datasource.dart';
import '/app/domain/entitities/workout_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_workouts_by_team/domain/i_repositories/i_create_workout_repository.dart';

class CreateWorkoutRepository implements ICreateWorkoutRepository {
  CreateWorkoutRepository(this._iCreateWorkoutDataSource);
  final ICreateWorkoutDataSource _iCreateWorkoutDataSource;
  @override
  Future<ReturnData<WorkoutEntity>> call(int teamId, String workoutName) async {
    return await _iCreateWorkoutDataSource(teamId, workoutName);
  }
}
