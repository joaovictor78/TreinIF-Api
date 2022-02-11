import '/app/modules/start/submodules/workouts/data/repositories/i_datasourses/i_get_all_trainers_by_individual_workout_datasource.dart';
import '/app/modules/start/submodules/workouts/data/dtos/list_trainer_dto.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/trainer_entity.dart';
import '/app/core/network/interfaces/i_http_client.dart';

class GetAllTrainersByIndividualWorkoutDataSource
    implements IGetAllTrainersByIndividualWorkoutDataSource {
  GetAllTrainersByIndividualWorkoutDataSource(this._client);
  final IHttpClient _client;

  Future<ReturnData<List<TrainerEntity>>> call() async {
    try {
      final response = await _client.get("/trainers-by-individual-workotus");
      return ReturnData(true,
          data: ListTrainersDTO.fromMap(response.data!).teams);
    } catch (error) {
      return ReturnData(false);
    }
  }
}
