import 'package:get/get.dart';
import '/app/core/network/custom_dio/custom_dio.dart';
import '/app/modules/register/controllers/register_user_controller.dart';
import '/app/modules/register/repositories/register_user_repository.dart';

class RegisterUserBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterUserRepository(Get.find<CustomDio>()));
    Get.lazyPut(() => RegisterUserController(Get.find()));
  }
}
