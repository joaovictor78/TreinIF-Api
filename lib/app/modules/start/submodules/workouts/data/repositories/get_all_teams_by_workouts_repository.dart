import 'i_datasourses/i_get_all_teams_workouts_datasource.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/team_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/domain/i_repositories/i_get_all_teams_by_workouts_repository.dart';

class GetAllTeamsByWorkoutsRepository implements IGetAllTeamsByWorkoutsRepository{
  IGetAllTeamsWorkoutsDataSource _getAllTeamsWorkoutsDataSource;
  GetAllTeamsByWorkoutsRepository(this._getAllTeamsWorkoutsDataSource);
  @override
  Future<ReturnData<List<TeamEntity>>> call() async{
    final _response = await _getAllTeamsWorkoutsDataSource();
    return _response;
  }

}

