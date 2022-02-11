import 'package:dio/dio.dart';
import '/app/modules/start/submodules/profile/data/dtos/data_user_dto.dart';
import '/app/core/network/interfaces/i_http_client.dart';
import '/app/core/utils/return_data.dart';
import '/app/modules/start/submodules/profile/data/repositories/i_datasources/i_update_data_user_datasource.dart';
import '/app/modules/start/submodules/profile/domain/entities/user_entity.dart';

class UpdateDataUserDataSource implements IUpdateDataUserDataSource {
  IHttpClient _client;
  UpdateDataUserDataSource(this._client);
  @override
  Future<ReturnData> call(UserEntity user) async {
    try {
      String fileName = user.profileImage!.path.split('/').last;
      Map data = DataUserDto(user: user).toMap();
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(user.profileImage!.path,
            filename: fileName),
        ...data
      });
      await _client.put("/update-user-data", data: formData);
      return ReturnData(true);
    } catch (error) {
      return ReturnData(false);
    }
  }
}
