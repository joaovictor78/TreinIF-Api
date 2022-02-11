import '/app/modules/manage_individual_workout/data/dtos/exercises_dto.dart';
import '/app/core/network/interfaces/i_http_client.dart';
import '/app/domain/entitities/exercise_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_individual_workout/data/repositories/i_datasources/i_get_individual_exercises_by_day_of_week_as_athlete_datasource.dart';

class GetIndividualExercisesByDayOfWeekAsAthleteDataSource
    implements IGetIndividualExercisesByDayOfWeekAsAthleteDataSource {
  GetIndividualExercisesByDayOfWeekAsAthleteDataSource(this._client);
  final IHttpClient _client;
  @override
  Future<ReturnData<List<ExerciseEntity>>> call(String dayOfWeek) async {
    try {
      final response = await _client.get("");
      ExercisesDTO exercisesDTO = ExercisesDTO.fromJson(response.data);
      return ReturnData(true, data: exercisesDTO.exercises);
    } catch (error) {
      return ReturnData(false);
    }
  }
}
