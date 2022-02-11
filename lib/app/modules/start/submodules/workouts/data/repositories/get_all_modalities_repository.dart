import '/app/modules/start/submodules/workouts/data/repositories/i_datasourses/i_get_all_modalities_datasource.dart';

import '/app/modules/start/submodules/workouts/domain/entitities/modality_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/domain/i_repositories/i_get_all_modalities_repository.dart';

class GetAllModalitiesRepository implements IGetAllModalitiesRepository{
  IGetAllModalitiesDataSource _iGetAllModalitiesDataSource;
  GetAllModalitiesRepository(this._iGetAllModalitiesDataSource);
  @override
  Future<ReturnData<List<ModalityEntity>>> call() {
    return _iGetAllModalitiesDataSource();
  }
  
}