import '/app/core/network/interfaces/i_http_client.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/team_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/data/repositories/i_datasourses/i_jon_a_team_datasource.dart';

class JoinATeamDataSource implements IJoinATeamDataSource {
  JoinATeamDataSource(this._client);
  final IHttpClient _client;
  @override
  Future<ReturnData<TeamEntity>> call(String code) async {
    try {
      final response = await _client.post("/teams/$code");
      return ReturnData(true, data: response.data);
    } catch (error) {
      return ReturnData(false);
    }
  }
}
