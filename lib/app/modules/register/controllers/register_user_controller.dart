import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/core/components/custom_toast.dart';
import '/app/core/models/athlete_model.dart';
import '/app/core/models/course_model.dart';
import '/app/core/styles/app_colors.dart';
import '/app/core/services/session_control_service.dart';
import '/app/core/models/logged_user_model.dart';
import '/app/core/models/user_model.dart';
import '/app/core/utils/return_data.dart';
import '/app/core/enums/user_types_enum.dart';
import '/app/modules/register/repositories/register_user_repository.dart';

class RegisterUserController extends GetxController {
  RegisterUserController(this.repository);
  final RegisterUserRepository repository;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController CPFController = TextEditingController();
  TextEditingController RGController = TextEditingController();
  var selectedDate = DateTime.now().obs;
  var listAllCourses = RxList<CourseModel>();
  SessionControllService _sessionControllService = SessionControllService();

  var isLoading = false.obs;
  var userTypeSelected = UserTypesEnum.athlete.obs;
  var selectedCourseId = 0.obs;
  var birthDate = "2021/10/11".obs;
  var selectedBlood = "".obs;
  var selectedCourse = Rxn<CourseModel>();

  changeUserType(int userTypeCode) {
    if (UserTypesEnum.athlete.code == userTypeCode) {
      userTypeSelected.value = UserTypesEnum.athlete;
    } else {
      userTypeSelected.value = UserTypesEnum.trainer;
    }
  }

  getAllCourses() async {
    final response = await repository.getAllCourses();
    if (response!.success) {
      listAllCourses.value = response.data!;
    } else {
      return CustomToast.showToast(response.message!,
          backgroundColor: Colors.red);
    }
  }

  registerTrainerUser() async {
    isLoading.value = true;
    final ReturnData<LoggedUserModel>? response = await repository.registerUser(
        UserModel(
            fullName: fullNameController.text,
            email: emailController.text,
            password: passwordController.text,
            profileAvatarURL: "",
            userType: userTypeSelected.value));

    if (response!.success) {
      _sessionControllService.insertUserData(response.data!.user!);
      _sessionControllService.insertTokens(response.data!.token!);
      isLoading.value = false;
      Get.offNamed("/start");
    } else {
      isLoading.value = false;
      return CustomToast.showToast(response.message!,
          backgroundColor: AppColors.red);
    }
  }

  registerAthleteUser() async {
    isLoading.value = true;
    final ReturnData<LoggedUserModel>? response =
        await repository.registerUser(AthleteModel(
      fullName: fullNameController.text,
      email: emailController.text,
      userType: userTypeSelected.value,
      password: passwordController.text,
      birthdate: birthDate.value,
      bloodType: selectedBlood.value,
      courseId: selectedCourse.value!.id,
      cpf: CPFController.text,
      rg: RGController.text,
      profileAvatarURL: "",
    ));

    if (response!.success) {
      _sessionControllService.insertUserData(response.data!.user!);
      _sessionControllService.insertTokens(response.data!.token!);
      isLoading.value = false;
      Get.toNamed("/start");
    } else {
      isLoading.value = false;
      return CustomToast.showToast(response.message!,
          backgroundColor: AppColors.red);
    }
  }
}
