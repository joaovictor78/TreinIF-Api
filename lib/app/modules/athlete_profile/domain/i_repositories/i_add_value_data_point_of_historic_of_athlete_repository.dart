import '/app/modules/athlete_profile/domain/entities/value_data_point_of_athlete_historic_entity.dart';
import '/app/core/utils/return_data.dart';

abstract class IAddValueDataPointOfHistoricOfAthleteRepository{
  Future<ReturnData<ValueDataPointOfAthleteHistoricEntity>> call(int athleteID, int dataPointID, ValueDataPointOfAthleteHistoricEntity valueDataPoint);
}