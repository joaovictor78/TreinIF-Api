import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/core/models/logged_user_model.dart';
import '/app/core/services/session_control_service.dart';
import '/app/core/utils/return_data.dart';
import '/app/core/components/custom_toast.dart';
import '/app/core/styles/app_colors.dart';
import '/app/modules/login/models/user_credentials_model.dart';
import '/app/modules/login/repositories/login_repository.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  LoginController(this._repository);
  LoginRepository _repository;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SessionControllService _sessionControllService = SessionControllService();
  AnimationController? controller;
  Animation<double>? animation;
  var isFinishAnimation = false.obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    final duration = const Duration(milliseconds: 2000);
    controller = AnimationController(duration: duration, vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(controller!);
    super.onInit();
  }

  onFinishAnimation() {
    controller!.forward();
    isFinishAnimation.value = animation!.isCompleted;
  }

  authenticate() async {
    isLoading.value = true;
    ReturnData<LoggedUserModel?>? response;
    String email = emailController.text;
    String password = passwordController.text;
    response =
        await _repository.authenticate(UserCredentialsModel(email, password));

    if (response!.success == true) {
      await _sessionControllService.insertUserData(response.data!.user!);
      await _sessionControllService.insertTokens(response.data!.token!);
      isLoading.value = false;
      Get.toNamed("/start", arguments: response.data!.user!.userType!);
    } else {
      isLoading.value = false;
      return CustomToast.showToast(response.message!,
          backgroundColor: AppColors.red, timeInSecForIosWeb: 60);
    }
  }
}
