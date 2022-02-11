import '/app/modules/manage_exercicies_types/data/repositories/i_datasources/i_remove_exercise_type_datasource.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_exercicies_types/domain/i_repositories/i_remove_exercise_type_repository.dart';

class RemoveExerciseTypeRepository implements IRemoveExerciseTypeRepository{
  IRemoveExerciseTypeDataSource _iRemoveExerciseTypeDataSource;
  RemoveExerciseTypeRepository(this._iRemoveExerciseTypeDataSource);
  @override
  Future<ReturnData> call(int id) async {
     return await _iRemoveExerciseTypeDataSource(id);
  }

}