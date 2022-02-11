import '/app/modules/manage_workouts_by_team/data/repositories/i_datasources/i_get_all_team_exercises_by_day_of_week_as_athlete_datasource.dart';
import '/app/modules/manage_individual_workout/data/dtos/exercises_dto.dart';
import '/app/core/utils/return_data.dart';
import '/app/domain/entitities/exercise_entity.dart';
import '/app/core/network/interfaces/i_http_client.dart';

class GetAllTeamExercisesByDayOfWeekAsAthleteDataSource
    implements IGetAllTeamExercisesByDayOfWeekAsAthleteDataSource {
  GetAllTeamExercisesByDayOfWeekAsAthleteDataSource(this._client);
  final IHttpClient _client;

  @override
  Future<ReturnData<List<ExerciseEntity>>> call() async {
    try {
      final response = await _client.get("/");
      ExercisesDTO exercisesDTO = ExercisesDTO.fromJson(response.data);
      return ReturnData(true, data: exercisesDTO.exercises);
    } catch (error) {
      return ReturnData(false);
    }
  }
}
