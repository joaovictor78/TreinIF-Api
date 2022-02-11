import '/app/modules/start/submodules/profile/data/repositories/i_datasources/i_update_data_user_datasource.dart';
import '/app/modules/start/submodules/profile/domain/entities/user_entity.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/profile/domain/i_repositories/i_update_data_user_repository.dart';

class UpdateDataUserRepository implements IUpdateDataUserRepository {
  IUpdateDataUserDataSource _iUpdateDataUserDataSource;
  UpdateDataUserRepository(this._iUpdateDataUserDataSource);
  @override
  Future<ReturnData> call(UserEntity user) async {
    return await _iUpdateDataUserDataSource(user);
  }
}
