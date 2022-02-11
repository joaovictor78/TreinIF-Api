import '/app/modules/athlete_profile/data/repositories/i_datasources/i_get_all_athlete_workouts_datasource.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/domain/i_repositories/i_get_all_individual_workouts_repository.dart';

class GetAllIndividualWorkoutsRepository implements IGetAllIndividualWorkoutsRepository{
  GetAllIndividualWorkoutsRepository(this._iGetAllAthleteWorkoutsDataSource);
  IGetAllAthleteWorkoutsDataSource _iGetAllAthleteWorkoutsDataSource;
  @override
  Future<ReturnData> call(int athleteID) async{
    return await _iGetAllAthleteWorkoutsDataSource(athleteID);
  }
  
}