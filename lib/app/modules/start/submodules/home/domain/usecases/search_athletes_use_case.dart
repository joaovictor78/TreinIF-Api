import '/app/domain/entitities/athlete_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/home/domain/i_repositories/i_search_athletes_repository.dart';

class SearchAthletesUseCase {
  SearchAthletesUseCase(this._searchAthletesRepository);
  final ISearchAthletesRepository _searchAthletesRepository;
  Future<ReturnData<List<AthleteEntity>>> call({
    required int limit,
    required int page,
    required String searchTerm
  }) async {
    final response = await _searchAthletesRepository(
        limit: limit, page: page, searchTerm: searchTerm);
    return response; 
  }
}
