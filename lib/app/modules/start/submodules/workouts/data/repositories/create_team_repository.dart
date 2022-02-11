import '/app/modules/start/submodules/workouts/data/repositories/i_datasourses/i_create_team_datasource.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/team_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/domain/i_repositories/i_create_team_repository.dart';

class CreateTeamRepository implements ICreateTeamRepository{
  CreateTeamRepository(this._iCreateTeamDataSource);
  ICreateTeamDataSource _iCreateTeamDataSource;
  @override
  Future<ReturnData> call(TeamEntity team) {
    return _iCreateTeamDataSource(team);
  }
}