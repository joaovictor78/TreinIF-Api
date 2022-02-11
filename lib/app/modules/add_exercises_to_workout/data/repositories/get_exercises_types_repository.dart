import '/app/modules/add_exercises_to_workout/data/repositories/i_datasources/i_get_exercises_types_datasource.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/add_exercises_to_workout/domain/i_repositories/i_get_exercies_types_repository.dart';

class GetExercisesTypesRepository implements IGetExercisesTypesRepository{
  IGetExercisesTypesDataSource _iGetExercisesTypeDataSource;
  GetExercisesTypesRepository(this._iGetExercisesTypeDataSource);
  @override
  Future<ReturnData> call() async{
    return await _iGetExercisesTypeDataSource();
  }

}