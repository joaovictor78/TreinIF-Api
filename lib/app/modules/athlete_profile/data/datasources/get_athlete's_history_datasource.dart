import '/app/modules/athlete_profile/data/dtos/data_point_of_athlete_historic_dto.dart';
import '/app/core/network/interfaces/i_http_client.dart';
import '/app/modules/athlete_profile/domain/entities/data_point_of_%20athlete_historic_entity.dart';
import '/app/core/utils/return_data.dart';
import "/app/modules/athlete_profile/data/repositories/i_datasources/i_get_athlete's_history_datasource.dart";

class GetAthletesHistoryDataSource implements IGetAthletesHistoryDataSource {
  GetAthletesHistoryDataSource(this._client);
  final IHttpClient _client;
  @override
  Future<ReturnData<List<DataPointOfAthleteHistoricEntity>>> call(
      int athleteID) async {
    try {
      final _response = await _client.get("/athletes/$athleteID/historic");
      List<DataPointOfAthleteHistoricEntity> dataPoints = (_response
              .data["data_points"] as List)
          .map((dataPoint) => DataPointOfAthleteHistoricDTO.fromJson(dataPoint))
          .toList();
      return ReturnData(true, data: dataPoints);
    } catch (error) {
      return ReturnData(false);
    }
  }
}
