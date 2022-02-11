import '/app/modules/manage_individual_workout/data/dtos/exercises_dto.dart';

import '/app/domain/entitities/exercise_entity.dart';
import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/add_exercises_to_workout/data/repositories/i_datasources/i_add_exercise_datasource.dart';

class AddExerciseDataSource implements IAddExerciseDataSource{
  IHttpClient _client;
  AddExerciseDataSource(this._client);
  @override
  Future<ReturnData<ExerciseEntity>> call(int workoutID, int type, ExerciseEntity exercise) async {
    try{
      ExerciseDTO exerciseDTO = ExerciseDTO(exerciseType: exercise.exerciseType, exerciseVariation: exercise.exerciseVariation, seriesNumber: exercise.seriesNumber, daysOfWeek: exercise.daysOfWeek, repeatTimeInSeconds: exercise.repeatTimeInSeconds);
      final response = await _client.post("/workouts/$workoutID/exercises?type=$type", data: exerciseDTO.toJson());
      return ReturnData(true);
    }catch(error){
      return ReturnData(false);
    }
  }

}