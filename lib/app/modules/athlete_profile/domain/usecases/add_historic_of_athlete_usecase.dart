import '/app/modules/athlete_profile/domain/entities/data_point_of_%20athlete_historic_entity.dart';
import '/app/modules/athlete_profile/domain/i_repositories/i_add_historic_of_athlete_repository.dart';
import '/app/core/utils/return_data.dart';
class AddHistoricOfAthleteUseCase{
  IAddHistoricOfAthleteRepository _iAddHistoricOfAthleteRepository;
  AddHistoricOfAthleteUseCase(this._iAddHistoricOfAthleteRepository);
  Future<ReturnData> call(int athleteID, DataPointOfAthleteHistoricEntity dataPoint){
    return _iAddHistoricOfAthleteRepository(athleteID, dataPoint);
  }
}