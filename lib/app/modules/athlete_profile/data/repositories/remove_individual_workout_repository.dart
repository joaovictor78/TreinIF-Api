import '/app/modules/athlete_profile/data/repositories/i_datasources/i_remove_individual_workout_datasource.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/domain/i_repositories/i_remove_individual_workout_repository.dart';

class RemoveIndividualWorkoutRepository implements IRemoveIndividualWorkoutRepository{
  IRemoveIndividualWorkoutDataSource _iRemoveIndividualWorkoutDataSource;
  RemoveIndividualWorkoutRepository(this._iRemoveIndividualWorkoutDataSource);
  @override
  Future<ReturnData> call(int individualWorkout) async {
    return _iRemoveIndividualWorkoutDataSource(individualWorkout);
  }

}