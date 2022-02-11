import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/team_entity.dart';
import '/app/modules/start/submodules/workouts/domain/i_repositories/i_get_all_teams_by_workouts_repository.dart';

class GetAllTeamsByWorkoutsUseCase {
  IGetAllTeamsByWorkoutsRepository _allTeamsByWorkoutsRepository;
  GetAllTeamsByWorkoutsUseCase(this._allTeamsByWorkoutsRepository);
  Future<ReturnData<List<TeamEntity>>> call() async {
    final _response = _allTeamsByWorkoutsRepository();
    return _response;
  }
}
