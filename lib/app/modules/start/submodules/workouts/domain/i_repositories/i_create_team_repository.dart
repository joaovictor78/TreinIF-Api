import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/team_entity.dart';

abstract class ICreateTeamRepository {
  Future<ReturnData> call(TeamEntity team);
}
