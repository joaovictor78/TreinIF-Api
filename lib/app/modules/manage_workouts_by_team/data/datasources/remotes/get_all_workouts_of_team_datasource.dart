import '/app/modules/manage_workouts_by_team/data/dtos/workout_dto.dart';
import '/app/core/network/interfaces/i_http_client.dart';
import '/app/domain/entitities/workout_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_workouts_by_team/data/repositories/i_datasources/i_get_all_workouts_of_team_datasource.dart';

class GetAllWorkoutsOfTeamDataSource
    implements IGetAllWorkoutsOfTeamDataSource {
  GetAllWorkoutsOfTeamDataSource(this._client);
  final IHttpClient _client;
  @override
  Future<ReturnData<List<WorkoutEntity>>> call(int teamId) async {
    try {
      final response = await _client.get("/teams/$teamId/workouts");
      List<WorkoutEntity> list = (response.data["workouts"] as List)
          .map((element) => WorkoutDTO.fromMap(element))
          .toList();
      return ReturnData(true, data: list);
    } catch (error) {
      return ReturnData(false);
    }
  }
}
