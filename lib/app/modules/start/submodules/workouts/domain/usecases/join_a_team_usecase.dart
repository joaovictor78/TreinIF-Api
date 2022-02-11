import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/team_entity.dart';
import '/app/modules/start/submodules/workouts/domain/i_repositories/i_join_a_team_repository.dart';

class JoinATeamUseCase {
  JoinATeamUseCase(this._iJoinATeamRepository);
  final IJoinATeamRepository _iJoinATeamRepository;

  Future<ReturnData<TeamEntity>> call(String code) {
    return _iJoinATeamRepository(code);
  }
}
