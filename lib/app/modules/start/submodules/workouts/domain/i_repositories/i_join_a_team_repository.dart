import '/app/modules/start/submodules/workouts/domain/entitities/team_entity.dart';
import '/app/core/utils/return_data.dart';

abstract class IJoinATeamRepository {
  Future<ReturnData<TeamEntity>> call(String code);
}
