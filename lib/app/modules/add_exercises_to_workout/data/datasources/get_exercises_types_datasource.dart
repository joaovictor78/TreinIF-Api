import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/domain/entitities/exercise_type_entity.dart';
import '/app/modules/add_exercises_to_workout/data/repositories/i_datasources/i_get_exercises_types_datasource.dart';
import '/app/modules/manage_exercicies_types/domain/dtos/exercises_types_dto.dart';

class GetExercisesTypesDataSource implements IGetExercisesTypesDataSource{
    GetExercisesTypesDataSource(this._client);
  IHttpClient _client;
  @override
  Future<ReturnData<List<ExerciseTypeEntity>>> call() async {
    try{
      final response = await _client.get("/trainer/exercises-types");
      final listExercisesTypes = ExercisesTypesDTO.fromJson(response.data);
      return ReturnData(true, data: listExercisesTypes.exercisesTypes);
    } catch(error){
      return ReturnData(false);
    }
  }
}