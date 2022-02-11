import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '/app/modules/login/controllers/login_controller.dart';
import '/app/core/network/custom_dio/custom_dio.dart';
import 'modules/login/repositories/login_repository.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.put(CustomDio(Get.find(), "https://treinif-api.herokuapp.com"));  
    Get.lazyPut(() => LoginRepository(Get.find<CustomDio>()));
    Get.lazyPut(() => LoginController(Get.find<LoginRepository>()));
  } 
}
