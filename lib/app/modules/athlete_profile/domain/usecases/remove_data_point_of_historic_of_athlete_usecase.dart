import '/app/modules/athlete_profile/domain/i_repositories/i_remove_data_point_of_historic_of_athlete_repository.dart';
import '/app/core/utils/return_data.dart';

class RemoveDataPointOfHistoricOfAthleteUseCase{
  IRemoveDataPointOfHistoricOfAthleteRepository _iRemoveDataPointOfHistoricOfAthleteRepository;
  RemoveDataPointOfHistoricOfAthleteUseCase(this._iRemoveDataPointOfHistoricOfAthleteRepository);
  Future<ReturnData> call(int athleteID, int dataPointID) async {
    return _iRemoveDataPointOfHistoricOfAthleteRepository(athleteID, dataPointID);
  }
}