import '/app/core/utils/return_data.dart';

import '/app/modules/start/submodules/workouts/domain/entitities/code_entitiy.dart';

abstract class IGenerateCodeToWorkoutRepository {
  Future<ReturnData<CodeEntity>> call();
}
