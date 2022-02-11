import '/app/domain/entitities/athlete_entity.dart';
import '/app/core/utils/return_data.dart';

abstract class IGetAllAthletesByIndividualWorkoutsRepository{
  Future<ReturnData<List<AthleteEntity>>> call();
}