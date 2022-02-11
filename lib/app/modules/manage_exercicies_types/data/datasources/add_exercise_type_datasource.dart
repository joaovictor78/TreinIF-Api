import '/app/domain/entitities/exercise_type_entity.dart';
import '/app/modules/manage_individual_workout/data/dtos/exercises_dto.dart';
import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_exercicies_types/data/repositories/i_datasources/i_add_exercise_type_datasource.dart';

class AddExerciseTypeDataSource implements IAddExerciseTypeDataSource{
  final IHttpClient _client;
  AddExerciseTypeDataSource(this._client);
  @override
  Future<ReturnData<ExerciseTypeEntity>> call(String exerciseTypeName) async {
    try{
      final response = await _client.post("/trainer/exercises-types", data: { "exercise_type_name" : exerciseTypeName });
      return ReturnData(true, data: ExerciseTypeDTO.fromJson(response.data));
    }catch(error){
      return ReturnData(false);
    }
  }
}