import '/app/modules/athlete_profile/domain/entities/value_data_point_of_athlete_historic_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/athlete_profile/domain/i_repositories/i_add_value_data_point_of_historic_of_athlete_repository.dart';

class AddValueDataPointOfHistoricOfAthleteUseCase{
   AddValueDataPointOfHistoricOfAthleteUseCase(this._iAddValueDataPointOfHistoricOfAthleteRepository);
   IAddValueDataPointOfHistoricOfAthleteRepository _iAddValueDataPointOfHistoricOfAthleteRepository;

   Future<ReturnData<ValueDataPointOfAthleteHistoricEntity>> call(int athleteID, int dataPointID, ValueDataPointOfAthleteHistoricEntity valueDataPoint) async {
     return await _iAddValueDataPointOfHistoricOfAthleteRepository(athleteID, dataPointID, valueDataPoint);
   }
}