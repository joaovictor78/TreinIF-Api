import '/app/modules/manage_workouts_by_team/data/repositories/i_datasources/i_get_all_workouts_of_team_datasource.dart';
import '/app/domain/entitities/workout_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_workouts_by_team/domain/i_repositories/i_get_all_workouts_of_team_repository.dart';

class GetAllWorkoutsOfTeamRepository
    implements IGetAllWorkoutsOfTeamRepository {
  GetAllWorkoutsOfTeamRepository(this._iGetAllWorkoutsOfTeamDataSource);
  IGetAllWorkoutsOfTeamDataSource _iGetAllWorkoutsOfTeamDataSource;
  @override
  Future<ReturnData<List<WorkoutEntity>>> call(int teamId) async {
    return await _iGetAllWorkoutsOfTeamDataSource(teamId);
  }
}
