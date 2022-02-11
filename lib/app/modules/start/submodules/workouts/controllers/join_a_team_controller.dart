import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '/app/core/styles/app_colors.dart';
import '/app/core/components/custom_toast.dart';
import '/app/modules/start/submodules/workouts/domain/usecases/join_a_team_usecase.dart';

class JoinATeamController extends GetxController {
  JoinATeamController(this._joinATeamUseCase);
  final JoinATeamUseCase _joinATeamUseCase;
  final TextEditingController codeTextController = TextEditingController();

  @override
  onClose() {
    codeTextController.dispose();
    super.onClose();
  }

  joinATeam() async {
    final response = await _joinATeamUseCase(codeTextController.text);
    if (!response.success) {
      return CustomToast.showToast("Ocorreu um erro ao entrar no time",
          backgroundColor: AppColors.red);
    }
  }
}
