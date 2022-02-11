import '/app/modules/athlete_profile/data/dtos/individual_workouts_dto.dart';
import '/app/domain/entitities/individual_workout_entity.dart';
import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/data/repositories/i_datasources/i_add_individual_workout_datasource.dart';

class AddIndividualWorkoutDataSource implements IAddIndividualWorkoutDataSource{
  IHttpClient _client;
  AddIndividualWorkoutDataSource(this._client);
  @override
  Future<ReturnData<IndividualWorkoutEntity>> call(int athleteID, String? workoutName) async {
    try{
      final response = await _client.post("/athletes/$athleteID/individual/workouts", data: { "name" : workoutName });
      return ReturnData(true, data: Workouts.fromJson(response.data));
    } catch(error){
      return ReturnData(false);
    }
  }

}