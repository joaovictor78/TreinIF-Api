import 'package:get/get.dart';
import '/app/modules/start/submodules/profile/data/datasources/get_all_courses_datasource.dart';
import '/app/modules/start/submodules/profile/data/repositories/get_all_courses_repository.dart';
import '/app/modules/start/submodules/profile/domain/usecases/get_all_courses_usecase.dart';
import '/app/core/network/custom_dio/custom_dio.dart';
import '/app/modules/start/submodules/profile/data/datasources/update_data_user_datasource.dart';
import '/app/modules/start/submodules/profile/data/repositories/update_data_user_repository.dart';
import '/app/modules/start/submodules/profile/domain/usecases/update_data_user_usecase.dart';
import '/app/modules/start/submodules/profile/controllers/update_data_user_controller.dart';

class ProfileBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateDataUserDataSource(Get.find<CustomDio>()));
    Get.lazyPut(
        () => UpdateDataUserRepository(Get.find<UpdateDataUserDataSource>()));
    Get.lazyPut(() => UpdateDataUserCase(Get.find<UpdateDataUserRepository>()));
    Get.lazyPut(() => GetAllCoursesDataSource(Get.find<CustomDio>()));
    Get.lazyPut(
        () => GetAllCoursesRepository(Get.find<GetAllCoursesDataSource>()));
    Get.lazyPut(
        () => GetAllCoursesUseCase(Get.find<GetAllCoursesRepository>()));
    Get.lazyPut(() => UpdateDataUserController(Get.find(), Get.find()));
  }
}
