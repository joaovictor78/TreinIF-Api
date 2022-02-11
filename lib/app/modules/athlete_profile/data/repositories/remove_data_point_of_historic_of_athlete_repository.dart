import '/app/modules/athlete_profile/data/repositories/i_datasources/i_remove_data_point_of_historic_of_athlete_datasource.dart';
import '/app/core/utils/return_data.dart';
import '../../domain/i_repositories/i_remove_data_point_of_historic_of_athlete_repository.dart';

class RemoveDataPointOfHistoricOfAthleteRepository implements IRemoveDataPointOfHistoricOfAthleteRepository{
  IRemoveDataPointOfHistoricOfAthleteDataSource _iRemoveDataPointOfHistoricOfAthleteDataSource;
  RemoveDataPointOfHistoricOfAthleteRepository(this._iRemoveDataPointOfHistoricOfAthleteDataSource);
  @override
  Future<ReturnData> call(int athleteID, int dataPointID) async {
    return await _iRemoveDataPointOfHistoricOfAthleteDataSource(athleteID, dataPointID);
  }
}