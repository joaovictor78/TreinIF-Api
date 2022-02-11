import '/app/modules/athlete_profile/data/repositories/i_datasources/i_update_date_data_point_of_historic_of_athlete_datasource.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/domain/i_repositories/i_update_date_data_point_of_historic_of_athlete_repository.dart';

class UpdateDateDataPointOfHistoricOfAthleteRepository implements IUpdateDateDataPointOfHistoricOfAthleteRepository{
  IUpdateDateDataPointOfHistoricOfAthleteDataSource _iUpdateDateDataPointOfHistoricOfAthleteDataSource;
  UpdateDateDataPointOfHistoricOfAthleteRepository(this._iUpdateDateDataPointOfHistoricOfAthleteDataSource);
  @override
  Future<ReturnData> call(int athleteID, int dataPointID, String date) async {
    return await _iUpdateDateDataPointOfHistoricOfAthleteDataSource(athleteID, dataPointID, date);
  }

}