import '/app/domain/entitities/individual_workout_entity.dart';
import '/app/modules/athlete_profile/data/repositories/i_datasources/i_add_individual_workout_datasource.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/domain/i_repositories/i_add_individual_workout_repository.dart';

class AddIndividualWorkoutRepository implements IAddIndividualWorkoutRepository{
  IAddIndividualWorkoutDataSource _iAddIndividualWorkoutDataSource;
  AddIndividualWorkoutRepository(this._iAddIndividualWorkoutDataSource);
  @override
  Future<ReturnData<IndividualWorkoutEntity>> call(int athleteID, String? workoutName) async {
    return await _iAddIndividualWorkoutDataSource(athleteID, workoutName);
  }

}