import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/domain/i_repositories/i_remove_value_data_point_of_historic_of_athlete_usecase.dart';

class RemoveValueDataPointOfHistoricOfAthleteUseCase{
  IRemoveValueDataPointOfHistoricOfAthleteUseCase _iRemoveValueDataPointOfHistoricOfAthleteUseCase;
  RemoveValueDataPointOfHistoricOfAthleteUseCase(this._iRemoveValueDataPointOfHistoricOfAthleteUseCase);

  Future<ReturnData> call(int athleteID, int dataPointID,  int valueDataPointID) async {
    return await _iRemoveValueDataPointOfHistoricOfAthleteUseCase(athleteID, dataPointID, valueDataPointID);
  }

}