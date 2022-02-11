import '/app/domain/entitities/athlete_entity.dart';
import '/app/modules/start/submodules/home/data/datasources/i_search_athletes_datasource.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/home/domain/i_repositories/i_search_athletes_repository.dart';

class SearchAthletesRepository implements ISearchAthletesRepository{
  SearchAthletesRepository(this._dataSource);
  final ISearchAthletesDataSource _dataSource;
  @override
  Future<ReturnData<List<AthleteEntity>>> call({required int limit, required int page, required String searchTerm}) async {
      return _dataSource(limit: limit, page: page,searchTerm: searchTerm);
  }
}