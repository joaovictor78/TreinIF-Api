import '/app/domain/entitities/athlete_entity.dart';
import '/app/core/utils/return_data.dart';

abstract class ISearchAthletesRepository{
  Future<ReturnData<List<AthleteEntity>>> call({required int limit, required int page, required String searchTerm});
}