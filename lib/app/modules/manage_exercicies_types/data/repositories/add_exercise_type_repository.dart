import '/app/modules/manage_exercicies_types/data/repositories/i_datasources/i_add_exercise_type_datasource.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_exercicies_types/domain/i_repositories/i_add_exercise_type_repository.dart';

class AddExerciseTypeRepository implements IAddExerciseTypeRepository{
  IAddExerciseTypeDataSource _iAddExerciseDataSource;
  AddExerciseTypeRepository(this._iAddExerciseDataSource);
  @override
  Future<ReturnData> call(String exerciseTypeName) async {
    return _iAddExerciseDataSource(exerciseTypeName);
  }

}