import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/modality_entity.dart';
import '/app/modules/start/submodules/workouts/domain/i_repositories/i_get_all_modalities_repository.dart';

class GetAllModalitiesUseCase{
  IGetAllModalitiesRepository _iGetAllModalitiesRepository;
  GetAllModalitiesUseCase(this._iGetAllModalitiesRepository);
  Future<ReturnData<List<ModalityEntity>>> call() async{
    return _iGetAllModalitiesRepository();
  }
}