import '/app/modules/manage_workouts_by_team/domain/i_repositories/i_get_all_athletes_of_team_repository.dart';
import '/app/core/utils/return_data.dart';
import '/app/domain/entitities/athlete_entity.dart';
import '/app/modules/manage_workouts_by_team/data/repositories/i_datasources/i_get_all_athletes_of_team_datasource.dart';

class GetAllAthletesOfTeamRepository
    implements IGetAllAthletesOfTeamRepository {
  GetAllAthletesOfTeamRepository(this._iGetAllAthletesOfTeamDataSource);
  final IGetAllAthletesOfTeamDataSource _iGetAllAthletesOfTeamDataSource;
  @override
  Future<ReturnData<List<AthleteEntity>>> call(int teamID) async {
    return _iGetAllAthletesOfTeamDataSource(teamID);
  }
}
