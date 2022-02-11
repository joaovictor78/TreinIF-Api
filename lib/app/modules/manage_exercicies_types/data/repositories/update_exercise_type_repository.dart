import '/app/modules/manage_exercicies_types/data/repositories/i_datasources/i_update_exercise_type_datasource.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_exercicies_types/domain/i_repositories/i_update_exercise_type_repository.dart';

class UpdateExerciseTypeRepository implements IUpdateExerciseTypeRepository{
  IUpdateExerciseTypeDataSource _iUpdateExerciseTypeDataSource;
  UpdateExerciseTypeRepository(this._iUpdateExerciseTypeDataSource);
  @override
  Future<ReturnData> call(int id, String exerciseTypeName) async {
    return await _iUpdateExerciseTypeDataSource(id, exerciseTypeName);
  }

}