import '/app/modules/athlete_profile/domain/entities/value_data_point_of_athlete_historic_entity.dart';
import '/app/modules/athlete_profile/data/repositories/i_datasources/i_add_value_data_point_of_historic_of_athlete_datasource.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/domain/i_repositories/i_add_value_data_point_of_historic_of_athlete_repository.dart';

class AddValueDataPointOfHistoricOfAthleteRepository implements IAddValueDataPointOfHistoricOfAthleteRepository{
  AddValueDataPointOfHistoricOfAthleteRepository(this._iAddValueDataPointOfHistoricOfAthleteDataSource);
  IAddValueDataPointOfHistoricOfAthleteDataSource _iAddValueDataPointOfHistoricOfAthleteDataSource;
  @override
  Future<ReturnData<ValueDataPointOfAthleteHistoricEntity>> call(int athleteID, int dataPointID, ValueDataPointOfAthleteHistoricEntity valueDataPoint) async {
    return await _iAddValueDataPointOfHistoricOfAthleteDataSource(athleteID, dataPointID, valueDataPoint);
  }
}