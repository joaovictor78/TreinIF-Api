import '/app/core/utils/return_data.dart';
import '/app/domain/entitities/workout_entity.dart';
import '/app/modules/manage_workouts_by_team/domain/i_repositories/i_get_all_workouts_of_team_repository.dart';

class GetAllWorkoutsOfTeamUseCase {
  GetAllWorkoutsOfTeamUseCase(this._iGetAllWorkoutsOfTeamRepository);
  final IGetAllWorkoutsOfTeamRepository _iGetAllWorkoutsOfTeamRepository;
  Future<ReturnData<List<WorkoutEntity>>> call(int teamId) async {
    return await _iGetAllWorkoutsOfTeamRepository(teamId);
  }
}
