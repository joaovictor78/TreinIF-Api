import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/data/repositories/i_datasources/i_remove_value_data_point_of_historic_of_athlete_datasource.dart';

class RemoveValueDataPointOfHistoricOfAthleteDataSource implements IRemoveValueDataPointOfHistoricOfAthleteDataSource{
  IHttpClient _client;
  RemoveValueDataPointOfHistoricOfAthleteDataSource(this._client);
  @override
  Future<ReturnData> call(int athleteID, int dataPointID,  int valueDataPointID) async {
    try{
      await _client.delete("/athletes/$athleteID/historic/data-point/$dataPointID/value-data-point/$valueDataPointID");
      return ReturnData(true);
    }catch(error){
      return ReturnData(false);
    }
  }

}