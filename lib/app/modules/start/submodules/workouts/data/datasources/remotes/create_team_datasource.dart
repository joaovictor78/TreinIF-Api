import '/app/modules/start/submodules/workouts/data/dtos/team_dto.dart';
import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/data/repositories/i_datasourses/i_create_team_datasource.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/team_entity.dart';

class CreateTeamDataSource implements ICreateTeamDataSource {
  CreateTeamDataSource(this._client);
  IHttpClient _client;
  @override
  Future<ReturnData<TeamEntity>> call(TeamEntity team) async {
    try {
      final response = await _client.post("/teams",
          data: TeamDTO(
                  name: team.name,
                  description: team.description,
                  code: team.code,
                  modality: team.modality)
              .toJson());
      return ReturnData(true, data: TeamDTO.fromMap(response.data));
    } catch (error) {
      return ReturnData(false);
    }
  }
}
