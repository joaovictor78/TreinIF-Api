import '/app/domain/entitities/athlete_entity.dart';
import 'i_datasourses/i_get_all_athletes_by_individual_workouts_datasource.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/domain/i_repositories/i_get_all_athletes_by_individual_workouts_repository.dart';

class GetAllAthletesByIndividualWorkoutsRepository implements IGetAllAthletesByIndividualWorkoutsRepository{
  GetAllAthletesByIndividualWorkoutsRepository(this._getAllAthletesByIndividualWorkoutsDataSource);
  IGetAllAthletesByIndividualWorkoutsDataSource _getAllAthletesByIndividualWorkoutsDataSource;
  @override
  Future<ReturnData<List<AthleteEntity>>> call() async {
   final _response = await _getAllAthletesByIndividualWorkoutsDataSource();
   return _response;
  }

}