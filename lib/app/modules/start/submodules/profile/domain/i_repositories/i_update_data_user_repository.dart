import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/profile/domain/entities/user_entity.dart';

abstract class IUpdateDataUserRepository{
  Future<ReturnData> call(UserEntity user);
}