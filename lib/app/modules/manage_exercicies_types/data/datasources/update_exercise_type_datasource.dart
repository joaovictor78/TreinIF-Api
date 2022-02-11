import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_exercicies_types/data/repositories/i_datasources/i_update_exercise_type_datasource.dart';

class UpdateExerciseTypeDataSource implements IUpdateExerciseTypeDataSource{
  IHttpClient _client;
  UpdateExerciseTypeDataSource(this._client);
  @override
  Future<ReturnData> call(int id, String exerciseTypeName) async  {
    await _client.put("/trainer/exercises-types/$id", data: { "exercise_type_name": exerciseTypeName });
     try{
       return ReturnData(true);
     } catch(error){
       return ReturnData(false);
     }
  }
  
}