import '/app/modules/athlete_profile/data/dtos/data_point_of_athlete_historic_dto.dart';
import '/app/modules/athlete_profile/domain/entities/value_data_point_of_athlete_historic_entity.dart';
import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/data/repositories/i_datasources/i_update_value_data_point_historic_of_athlete_datasource.dart';

class UpdateValueDataPointOfHistoricOfAthleteDataSource implements IUpdateValueDataPointHistoricOfAthleteDataSource{
  IHttpClient _client;
  UpdateValueDataPointOfHistoricOfAthleteDataSource(this._client);
  @override
  Future<ReturnData> call(int athleteID, int dataPointID, int valueDataPointID, ValueDataPointOfAthleteHistoricEntity valueDataPoint) async{
     try{
       Values value = Values(type: valueDataPoint.type, value: valueDataPoint.value);
       await _client.put("/athletes/$athleteID/historic/data-points/$dataPointID/value-data-point/$valueDataPointID", data: value.toJson());
       return ReturnData(true);
     } catch(error){
       return ReturnData(false);
     }
  }

}