import '/app/modules/athlete_profile/data/dtos/data_point_of_athlete_historic_dto.dart';
import '/app/modules/athlete_profile/domain/entities/value_data_point_of_athlete_historic_entity.dart';
import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/data/repositories/i_datasources/i_add_value_data_point_of_historic_of_athlete_datasource.dart';

class AddValueDataPointOfHistoricOfAthleteDataSource implements IAddValueDataPointOfHistoricOfAthleteDataSource{
  AddValueDataPointOfHistoricOfAthleteDataSource(this._client);
  IHttpClient _client;
  @override
  Future<ReturnData<ValueDataPointOfAthleteHistoricEntity>> call(int athleteID, int dataPointID, ValueDataPointOfAthleteHistoricEntity valueDataPoint) async {
      try{
        Values value = Values(type: valueDataPoint.type, value: valueDataPoint.value);
        final response = await _client.post("/athletes/$athleteID/historic/data-point/$dataPointID", data: value.toJson());
        return ReturnData(true, data: Values.fromJson(response.data));
      } catch(error){
        return ReturnData(false);
      }
  }

}