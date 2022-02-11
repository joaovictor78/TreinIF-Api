import '/app/core/utils/return_data.dart';
import '/app/modules/manage_workouts_by_team/domain/i_repositories/i_remove_exercise_repository.dart';

class RemoveExerciseUseCase {
  RemoveExerciseUseCase(this._iRemoveExerciseRepository);
  final IRemoveExerciseRepository _iRemoveExerciseRepository;

  Future<ReturnData> call() async {
    return _iRemoveExerciseRepository();
  }
}
