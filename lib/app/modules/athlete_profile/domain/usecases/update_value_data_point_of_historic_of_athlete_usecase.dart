import '/app/modules/athlete_profile/domain/entities/value_data_point_of_athlete_historic_entity.dart';

import '/app/modules/athlete_profile/domain/i_repositories/i_update_value_data_point_of_historic_of_athlete_repository.dart';
import '/app/core/utils/return_data.dart';

class UpdateValueDataPointOfHistoricOfAthleteUseCase {
  IUpdateValueDataPointOfHistoricOfAthleteRepository
      _iUpdateValueDataPointOfHistoricOfAthleteRepository;
  UpdateValueDataPointOfHistoricOfAthleteUseCase(
      this._iUpdateValueDataPointOfHistoricOfAthleteRepository);
  Future<ReturnData> call(int athleteID, int dataPointID, int valueDataPointID,
      ValueDataPointOfAthleteHistoricEntity valueDataPoint) async {
    return await _iUpdateValueDataPointOfHistoricOfAthleteRepository(
        athleteID, dataPointID, valueDataPointID, valueDataPoint);
  }
}
