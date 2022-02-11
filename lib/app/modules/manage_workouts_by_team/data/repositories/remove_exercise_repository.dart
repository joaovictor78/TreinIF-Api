import '/app/modules/manage_workouts_by_team/data/repositories/i_datasources/i_remove_exercise_datasource.dart';
import '/app/core/utils/return_data.dart';
import '../../../manage_workouts_by_team/domain/i_repositories/i_remove_exercise_repository.dart';

class RemoveExerciseRepository implements IRemoveExerciseRepository {
  RemoveExerciseRepository(this._iRemoveExerciseDataSource);
  final IRemoveExerciseDataSource _iRemoveExerciseDataSource;
  @override
  Future<ReturnData> call() {
    return _iRemoveExerciseDataSource();
  }
}
