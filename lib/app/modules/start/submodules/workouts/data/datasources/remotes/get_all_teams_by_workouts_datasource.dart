import 'dart:developer';

import '/app/modules/start/submodules/workouts/data/dtos/list_teams_dto.dart';

import '/app/core/network/interfaces/i_http_client.dart';
import '/app/modules/start/submodules/workouts/data/repositories/i_datasourses/i_get_all_teams_workouts_datasource.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/team_entity.dart';

import '/app/core/utils/return_data.dart';

class GetAllTeamsByWorkoutsDataSource implements IGetAllTeamsWorkoutsDataSource{
  GetAllTeamsByWorkoutsDataSource(this._client);
  final IHttpClient _client;
  @override
  Future<ReturnData<List<TeamEntity>>> call() async {
    try{
      ListTeamsDTO listTeams;
      final response = await _client.get("/teams");
      listTeams = ListTeamsDTO.fromMap(response.data);
      return ReturnData(true, data: listTeams.teams);
    }catch(error){
      log(error.toString());
      return ReturnData(false);
    }
  }
}