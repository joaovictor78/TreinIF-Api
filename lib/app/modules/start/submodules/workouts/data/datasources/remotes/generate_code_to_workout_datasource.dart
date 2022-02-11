import '/app/core/network/interfaces/i_http_client.dart';
import '/app/modules/start/submodules/workouts/data/dtos/code_dto.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/data/repositories/i_datasourses/i_generate_code_to_workout_datasource.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/code_entitiy.dart';

class GenerateCodeToWorkoutDataSource implements IGenerateCodeToWorkoutDataSource{
  GenerateCodeToWorkoutDataSource(this._client);
  IHttpClient _client;
  
  @override
  Future<ReturnData<CodeEntity>> call() async {
    try{
      final response = await _client.post("/teams/generate-code");
      return ReturnData(true, data: CodeDTO.fromJson(response.data));
    }catch(error){
      return ReturnData(false);
    }
  }

}