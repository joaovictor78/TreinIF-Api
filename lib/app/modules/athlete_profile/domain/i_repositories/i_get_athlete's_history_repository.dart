import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/domain/entities/data_point_of_%20athlete_historic_entity.dart';

abstract class IGetAthletesHistoryRepository{
  Future<ReturnData<List<DataPointOfAthleteHistoricEntity>>> call(int athleteID);
}