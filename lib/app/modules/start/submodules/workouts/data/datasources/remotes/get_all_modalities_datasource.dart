import '/app/core/network/interfaces/i_http_client.dart';
import '/app/modules/start/submodules/workouts/data/dtos/list_modalities_dto.dart';

import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/data/repositories/i_datasourses/i_get_all_modalities_datasource.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/modality_entity.dart';

class GetAllModalitiesDataSource implements IGetAllModalitiesDataSource {
  IHttpClient _client;
  GetAllModalitiesDataSource(this._client);
  @override
  Future<ReturnData<List<ModalityEntity>>> call() async {
    try {
      ListModalitiesDTO listModalities;
      final response = await _client.get("/modalities");
      listModalities = ListModalitiesDTO.fromJson(response.data);
      return ReturnData(true, data: listModalities.modalities);
    } catch (error) {
      return ReturnData(false);
    }
  }
}
