import '/app/modules/manage_workouts_by_team/data/dtos/workout_dto.dart';
import '/app/core/network/interfaces/i_http_client.dart';
import '/app/domain/entitities/workout_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_workouts_by_team/data/repositories/i_datasources/i_create_workout_datasource.dart';

class CreateWorkoutDataSource implements ICreateWorkoutDataSource {
  CreateWorkoutDataSource(this._client);
  final IHttpClient _client;
  @override
  Future<ReturnData<WorkoutEntity>> call(int teamId, String workoutName) async {
    try {
      final response = await _client
          .post("/teams/$teamId/workouts", data: {"name": workoutName});
      return ReturnData(true, data: WorkoutDTO.fromMap(response.data));
    } catch (error) {
      return ReturnData(false);
    }
  }
}
