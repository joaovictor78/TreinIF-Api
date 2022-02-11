import '/app/modules/start/submodules/workouts/data/repositories/i_datasourses/i_jon_a_team_datasource.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/team_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/domain/i_repositories/i_join_a_team_repository.dart';

class JoinATeamRepository implements IJoinATeamRepository {
  JoinATeamRepository(this._iJoinATeamDataSource);
  final IJoinATeamDataSource _iJoinATeamDataSource;
  @override
  Future<ReturnData<TeamEntity>> call(String code) async {
    return await _iJoinATeamDataSource(code);
  }
}
