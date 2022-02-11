import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/data/repositories/i_datasources/i_update_date_data_point_of_historic_of_athlete_datasource.dart';

class UpdateDateDataPointDataSource implements IUpdateDateDataPointOfHistoricOfAthleteDataSource{
  UpdateDateDataPointDataSource(this._client);
  IHttpClient _client;
  @override
  Future<ReturnData> call(int athleteID, int dataPointID, String date) async {
     try{
       await _client.put("/athletes/$athleteID/historic/data-points/$dataPointID", data: { "date": date });
       return ReturnData(true);
     } catch(error){
       return ReturnData(false);
     }
  }

}