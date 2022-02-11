import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '/app/core/models/logged_user_po.dart';
import '/app/core/services/session_control_service.dart';

class StartController extends GetxController {
  @override
  void onInit() async {
    LoggedUserPO.logeedUser!.user =
        await SessionControllService().getUserData();
    LoggedUserPO.logeedUser!.token = await SessionControllService().getTokens();
    log("AQUII" + LoggedUserPO.logeedUser!.token!.acessToken.toString());
    super.onInit();
  }

  PageController pageController = PageController();
  int currentIndex = 0;
  void pageChanged(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
  }
}
