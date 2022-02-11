import 'i_datasources/i_update_individual_workout_name_datasource.dart';
import '/app/core/utils/return_data.dart';
import '../../domain/i_repositories/i_update_individual_workout_name_repository.dart';

class UpdateIndividualWorkoutNameRepository implements IUpdateIndividualWorkoutNameRepository{
  UpdateIndividualWorkoutNameRepository(this._iUpdateWorkoutNameDataSource);
  IUpdateIndividualWorkoutNameDataSource _iUpdateWorkoutNameDataSource;
  @override
  Future<ReturnData> call(int workoutID, String name) async {
    return await _iUpdateWorkoutNameDataSource(workoutID, name);
  }
  
}