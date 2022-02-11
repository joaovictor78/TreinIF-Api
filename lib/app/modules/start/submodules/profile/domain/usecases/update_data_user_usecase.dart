import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/profile/domain/i_repositories/i_update_data_user_repository.dart';
import '/app/modules/start/submodules/profile/domain/entities/user_entity.dart';

class UpdateDataUserCase{
  UpdateDataUserCase(this._iUpdateDataUserRepository);
  IUpdateDataUserRepository _iUpdateDataUserRepository;
  Future<ReturnData> call(UserEntity user) async {
    return _iUpdateDataUserRepository(user);
  }
}