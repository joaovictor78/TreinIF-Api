import '/app/modules/athlete_profile/data/repositories/i_datasources/i_remove_value_data_point_of_historic_of_athlete_datasource.dart';

import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/domain/i_repositories/i_remove_value_data_point_of_historic_of_athlete_usecase.dart';

class RemoveValueDataPointOfHistoricOfAthleteRepository
    implements IRemoveValueDataPointOfHistoricOfAthleteUseCase {
  IRemoveValueDataPointOfHistoricOfAthleteDataSource
      _iRemoveValueDataPointOfHistoricOfAthleteDataSource;
  RemoveValueDataPointOfHistoricOfAthleteRepository(
      this._iRemoveValueDataPointOfHistoricOfAthleteDataSource);
  @override
  Future<ReturnData> call(
      int athleteID, int dataPointID, int valueDataPointID) async {
    return await _iRemoveValueDataPointOfHistoricOfAthleteDataSource(
        athleteID, dataPointID, valueDataPointID);
  }
}
