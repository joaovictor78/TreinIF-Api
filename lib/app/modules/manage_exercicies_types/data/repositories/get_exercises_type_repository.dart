import '/app/modules/manage_exercicies_types/data/repositories/i_datasources/i_get_exercises_type_datasource.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_exercicies_types/domain/i_repositories/i_get_exercises_types_repository.dart';

class GetExercisesTypeRepository implements IGetExercisesTypesRepository{
  IGetExercisesTypeDataSource _iGetExercisesTypeDataSource;
  GetExercisesTypeRepository(this._iGetExercisesTypeDataSource);
  @override
  Future<ReturnData> call() async{
    return await _iGetExercisesTypeDataSource();
  }

}