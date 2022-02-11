import '/app/modules/athlete_profile/domain/i_repositories/i_get_all_individual_workouts_repository.dart';
import '/app/core/utils/return_data.dart';

class GetAllIndividualWorkoutsOfAthleteUseCase{
  GetAllIndividualWorkoutsOfAthleteUseCase(this._iGetAllIndividualWorkoutsRepository);
  IGetAllIndividualWorkoutsRepository _iGetAllIndividualWorkoutsRepository;
  Future<ReturnData> call(int athleteID) async {
    return await _iGetAllIndividualWorkoutsRepository(athleteID);
  } 
}