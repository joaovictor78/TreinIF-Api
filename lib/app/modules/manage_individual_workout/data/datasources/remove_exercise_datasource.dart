import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_individual_workout/data/repositories/i_datasources/i_remove_exercise_datasource.dart';

class RemoveExerciseDataSource implements IRemoveExerciseDataSource{
  IHttpClient _client;
  RemoveExerciseDataSource(this._client);
  @override
  Future<ReturnData> call(int workoutID, int exerciseID) async{
    try{
      await _client.delete("/workouts/$workoutID/exercises/$exerciseID");
      return ReturnData(true);
    } catch(error){
        return ReturnData(false);
    }
  }

}