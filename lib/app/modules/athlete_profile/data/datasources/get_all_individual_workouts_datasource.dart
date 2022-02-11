import '/app/domain/entitities/individual_workout_entity.dart';
import '/app/modules/athlete_profile/data/dtos/individual_workouts_dto.dart';
import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/data/repositories/i_datasources/i_get_all_athlete_workouts_datasource.dart';

class GetAllIndividualWorkoutsDataSource
    implements IGetAllAthleteWorkoutsDataSource {
  GetAllIndividualWorkoutsDataSource(this._client);
  IHttpClient _client;
  @override
  Future<ReturnData<List<IndividualWorkoutEntity>>> call(int athleteID) async {
    try {
      final _response = await _client.get("/athletes/$athleteID/individual/workouts"); 
      IndividualWorkoutsDTO individualWorkoutsDTO = IndividualWorkoutsDTO.fromJson(_response.data);
      return ReturnData(true, data: individualWorkoutsDTO.workouts);
    } catch (error) {
      return ReturnData(false);
    }
  }
}
