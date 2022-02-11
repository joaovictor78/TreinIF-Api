import '/app/modules/athlete_profile/domain/entities/data_point_of_%20athlete_historic_entity.dart';
import '/app/core/utils/return_data.dart';
abstract class IAddHistoricOfAthleteRepository{
  Future<ReturnData> call(int athleteID, DataPointOfAthleteHistoricEntity dataPoint);
}