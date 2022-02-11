import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/team_entity.dart';
import '/app/modules/start/submodules/workouts/domain/i_repositories/i_create_team_repository.dart';

class CreateTeamUseCase {
  CreateTeamUseCase(this._iCreateTeamRepository);
  ICreateTeamRepository _iCreateTeamRepository;
  Future<ReturnData> call(TeamEntity team) async {
    return await _iCreateTeamRepository(team);
  }
}
