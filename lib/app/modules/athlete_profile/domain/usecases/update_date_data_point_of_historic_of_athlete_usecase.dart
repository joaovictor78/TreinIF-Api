import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/domain/i_repositories/i_update_date_data_point_of_historic_of_athlete_repository.dart';

class UpdateDateDataPointOfHistoricOfAthleteUseCase{
  IUpdateDateDataPointOfHistoricOfAthleteRepository _updateDateDataPointOfHistoricOfAthleteRepository;
  UpdateDateDataPointOfHistoricOfAthleteUseCase(this._updateDateDataPointOfHistoricOfAthleteRepository);
  Future<ReturnData> call(int athleteID, int dataPointID, String date) async {
    return await _updateDateDataPointOfHistoricOfAthleteRepository(athleteID, dataPointID, date);
  }
}