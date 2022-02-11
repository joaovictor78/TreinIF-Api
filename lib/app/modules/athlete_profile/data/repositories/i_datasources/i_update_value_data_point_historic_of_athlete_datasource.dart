import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/domain/entities/value_data_point_of_athlete_historic_entity.dart';

abstract class IUpdateValueDataPointHistoricOfAthleteDataSource{
  Future<ReturnData> call(int athleteID, int dataPointID, int valueDataPointID, ValueDataPointOfAthleteHistoricEntity valueDataPoint);
}