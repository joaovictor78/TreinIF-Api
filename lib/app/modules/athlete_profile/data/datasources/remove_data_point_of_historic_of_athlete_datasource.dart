import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/data/repositories/i_datasources/i_remove_data_point_of_historic_of_athlete_datasource.dart';

class RemoveDataPointOfHistoricOfAthleteDataSource implements IRemoveDataPointOfHistoricOfAthleteDataSource{
  IHttpClient _client;
  RemoveDataPointOfHistoricOfAthleteDataSource(this._client);
  @override
  Future<ReturnData> call(int athleteID, int dataPointID) async {
    try{
      await _client.delete("/athletes/$athleteID/historic/$dataPointID");
      return ReturnData(true);
    } catch(error){
      return ReturnData(false);
    }
  }

}