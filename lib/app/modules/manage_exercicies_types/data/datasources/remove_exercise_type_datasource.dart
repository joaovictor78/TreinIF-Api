import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_exercicies_types/data/repositories/i_datasources/i_remove_exercise_type_datasource.dart';

class RemoveExerciseTypeDataSource implements IRemoveExerciseTypeDataSource{
  RemoveExerciseTypeDataSource(this._client);
  IHttpClient _client;
  @override
  Future<ReturnData> call(int id) async {
     try{
       await _client.delete("/trainer/exercises-types/$id");
       return ReturnData(true);
     } catch(error){
       return ReturnData(false);
     }
  }
  
}