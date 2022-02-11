import '/app/domain/entitities/athlete_entity.dart';
import '/app/modules/start/submodules/home/data/dtos/list_ahtletes_dto.dart';
import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/home/data/datasources/i_search_athletes_datasource.dart';

class SearchAthletesDataSource implements ISearchAthletesDataSource{
  SearchAthletesDataSource(this._client);
  final IHttpClient _client;
  @override
  Future<ReturnData<List<AthleteEntity>>> call({required int limit, required int page, required String searchTerm}) async {
    try{
      final _response = await _client.get("/athletes?limit=$limit&page=$page&search_term=$searchTerm");
      ListAthletesDTO listAthletes = ListAthletesDTO.fromMap(_response.data);
      return ReturnData(true, data: listAthletes.athletes);
    } catch(error){
        return ReturnData(false, message: "Ocorreu um erro ao buscar os atletas");
    }
    
  
  }
}