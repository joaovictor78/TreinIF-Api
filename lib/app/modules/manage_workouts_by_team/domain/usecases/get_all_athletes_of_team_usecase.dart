import '/app/domain/entitities/athlete_entity.dart';
import '/app/modules/manage_workouts_by_team/domain/i_repositories/i_get_all_athletes_of_team_repository.dart';
import '/app/core/utils/return_data.dart';

class GetAllAthletesOfTeamUseCase {
  GetAllAthletesOfTeamUseCase(this._iGetAllAthletesOfTeamUseCase);
  final IGetAllAthletesOfTeamRepository _iGetAllAthletesOfTeamUseCase;
  Future<ReturnData<List<AthleteEntity>>> call(int teamID) async {
    return await _iGetAllAthletesOfTeamUseCase(teamID);
  }
}
