import '/app/core/utils/return_data.dart';
import '../repositories/i_datasources/i_update_individual_workout_status_datasource.dart';

import '/app/core/network/interfaces/i_http_client.dart';

class UpdateIndividualWorkoutStatusDataSource implements IUpdateIndividualWorkoutStatusDataSource{
  IHttpClient _client;
  UpdateIndividualWorkoutStatusDataSource(this._client);

  @override
  Future<ReturnData> call(int athleteID, int workoutID) async {
     try{
       await _client.put("/athletes/$athleteID/individual/workouts/$workoutID/activate");
       return ReturnData(true);
     } catch(error){
       return ReturnData(false);
     }
  }

}