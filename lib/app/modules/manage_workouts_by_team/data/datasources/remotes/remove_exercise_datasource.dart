import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_workouts_by_team/data/repositories/i_datasources/i_remove_exercise_datasource.dart';

class RemoveExerciseDataSource implements IRemoveExerciseDataSource {
  RemoveExerciseDataSource(this._client);
  final IHttpClient _client;
  @override
  Future<ReturnData> call() async {
    try {
      await _client.delete("/workouts/6/exercises/59");
      return ReturnData(true);
    } catch (error) {
      return ReturnData(false);
    }
  }
}
