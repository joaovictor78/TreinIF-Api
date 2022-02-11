import '/app/core/network/interfaces/i_http_client.dart';
import '/app/domain/entitities/athlete_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_workouts_by_team/data/repositories/i_datasources/i_get_all_athletes_of_team_datasource.dart';

class GetAllAthletesOfTeamDataSource
    implements IGetAllAthletesOfTeamDataSource {
  GetAllAthletesOfTeamDataSource(this._client);
  final IHttpClient _client;
  @override
  Future<ReturnData<List<AthleteEntity>>> call(int teamID) async {
    try {
      final response = await _client.get("");
      return ReturnData(true);
    } catch (error) {
      return ReturnData(false);
    }
  }
}
