import 'dart:developer';

import '/app/modules/manage_individual_workout/data/dtos/exercises_dto.dart';
import '/app/core/network/interfaces/i_http_client.dart';
import '/app/domain/entitities/exercise_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/manage_individual_workout/data/repositories/i_datasources/i_get_exercises_by_day_of_week_datasource.dart';

class GetExercisesByDayOfWeekDataSource
    implements IGetExercisesByDayOfWeekDataSource {
  IHttpClient _client;
  GetExercisesByDayOfWeekDataSource(this._client);
  @override
  Future<ReturnData<List<ExerciseEntity>>> call(
      int workoutID, String dayOfWeek, int type) async {
    try {
      final _response = await _client.get(
          "/workouts/$workoutID/exercises?day_of_week=$dayOfWeek&type=$type");
      log(_response.data.toString());
      ExercisesDTO exercisesDTO = ExercisesDTO.fromJson(_response.data);
      return ReturnData(true, data: exercisesDTO.exercises);
    } catch (error) {
      return ReturnData(false);
    }
  }
}
