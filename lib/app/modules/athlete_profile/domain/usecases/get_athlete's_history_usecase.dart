import '/app/core/utils/return_data.dart';
import "../i_repositories/i_get_athlete's_history_repository.dart";
import '/app/modules/athlete_profile/domain/entities/data_point_of_%20athlete_historic_entity.dart';

class GetAthletesHistoryUseCase{
  GetAthletesHistoryUseCase(this._iGetAthletesHistoryUseCase);
  IGetAthletesHistoryRepository _iGetAthletesHistoryUseCase;
  Future<ReturnData<List<DataPointOfAthleteHistoricEntity>>> call(int athleteID) async {
    return await _iGetAthletesHistoryUseCase(athleteID);
  }
}