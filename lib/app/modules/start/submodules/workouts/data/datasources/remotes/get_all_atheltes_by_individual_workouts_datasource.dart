import '/app/domain/entitities/athlete_entity.dart';
import '/app/modules/start/submodules/home/data/dtos/list_ahtletes_dto.dart';
import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/data/repositories/i_datasourses/i_get_all_athletes_by_individual_workouts_datasource.dart';

class GetAllAthletesByIndividualWorkoutsDataSource implements IGetAllAthletesByIndividualWorkoutsDataSource{
  GetAllAthletesByIndividualWorkoutsDataSource(this._client);
  final IHttpClient _client;
  @override
  Future<ReturnData<List<AthleteEntity>>> call() async {
    try{
      ListAthletesDTO listAthletesDTO = ListAthletesDTO();
      final response = await _client.get("/athletes/by-individual-workouts");
      listAthletesDTO = ListAthletesDTO.fromMap(response.data);
      return ReturnData(true, data: listAthletesDTO.athletes);
    }catch(error){
      return ReturnData(false);
    }
  }

}