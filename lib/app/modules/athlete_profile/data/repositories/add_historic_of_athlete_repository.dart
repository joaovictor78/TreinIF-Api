import '/app/modules/athlete_profile/data/repositories/i_datasources/i_add_historic_of_athlete_datasource.dart';
import '/app/modules/athlete_profile/domain/entities/data_point_of_%20athlete_historic_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/domain/i_repositories/i_add_historic_of_athlete_repository.dart';

class AddHistoricOfAthleteRepository implements IAddHistoricOfAthleteRepository{
  IAddHistoricOfAthleteDataSource _iAddHistoricOfAthleteDataSource;
  AddHistoricOfAthleteRepository(this._iAddHistoricOfAthleteDataSource);
  @override
  Future<ReturnData> call(int athleteID, DataPointOfAthleteHistoricEntity dataPoint)  async {
    return await _iAddHistoricOfAthleteDataSource(athleteID, dataPoint);
  }

}