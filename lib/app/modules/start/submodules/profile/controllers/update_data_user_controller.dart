import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '/app/core/components/custom_toast.dart';
import '/app/core/styles/app_colors.dart';
import '/app/domain/entitities/course_entity.dart';
import '/app/modules/start/submodules/profile/domain/usecases/get_all_courses_usecase.dart';
import '/app/modules/start/submodules/profile/domain/usecases/update_data_user_usecase.dart';

class UpdateDataUserController extends GetxController {
  UpdateDataUserController(
      this._updateDataUserCase, this._getAllCoursesUseCase);
  UpdateDataUserCase _updateDataUserCase;
  GetAllCoursesUseCase _getAllCoursesUseCase;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController CPFController = TextEditingController();
  TextEditingController RGController = TextEditingController();
  var selectedDate = DateTime.now().obs;
  var listAllCourses = RxList<CourseEntity>();

  var isLoading = false.obs;
  var selectedCourseId = 0.obs;
  var birthDate = "2021/10/11".obs;
  var selectedBlood = "".obs;
  var selectedCourse = Rxn<CourseEntity>();

  @override
  void onInit() {
    super.onInit();
  }

  getAllCourses() async {
    final response = await _getAllCoursesUseCase();
    if (!response.success) {
      return CustomToast.showToast(
          "Não foi possivel carregar os cursos da instituição!",
          backgroundColor: AppColors.red);
    }
  }
}
