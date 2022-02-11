import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/modules/start/submodules/workouts/presentation/pages/join_a_team_page.dart';
import '/app/modules/start/submodules/profile/presentation/pages/update_data_user_page.dart';
import '/app/modules/start/submodules/profile/profile_biding.dart';
import '/app/modules/manage_exercicies_types/manage_exercises_types_biding.dart';
import '/app/modules/manage_individual_workout/manage_individual_workout_biding.dart';
import '/app/modules/add_exercises_to_workout/add_exercises_to_workout_biding.dart';
import '/app/modules/manage_exercicies_types/presentation/pages/manage_exercises_types_page.dart';
import '/app/modules/manage_individual_workout/presentation/pages/manage_individual_workout_page.dart';
import '/app/modules/athlete_profile/presentation/pages/historic_of_athlete_page.dart';
import 'app/modules/add_exercises_to_workout/presentation/pages/add_exercise_page.dart';
import '/app/modules/athlete_profile/athlete_profile_biding.dart';
import '/app/modules/athlete_profile/presentation/pages/athlete_profile_page.dart';
import '/app/modules/manage_workouts_by_team/presentation/pages/list_workouts_by_team_page.dart';
import '/app/modules/manage_workouts_by_team/presentation/pages/manage_workout_page.dart';
import '/app/modules/register/register_user_biding.dart';
import '/app/modules/start/submodules/workouts/presentation/pages/create_team_page.dart';
import '/app/app_binding.dart';
import '/app/modules/manage_workouts_by_team/manage_workouts_by_team_biding.dart';
import 'app/modules/start/start_biding.dart';
import 'app/modules/start/start_page.dart';
import 'app/core/styles/app_colors.dart';
import 'app/modules/login/pages/forgot_password_page.dart';
import 'app/modules/login/pages/login_page.dart';
import 'app/modules/register/pages/register_account_page.dart';
import 'app/modules/register/pages/register_supplementary_data_page.dart';

void main() {
  AppBinding().dependencies();
  runApp(GetMaterialApp(
    theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        hintColor: AppColors.primaryColor,
        unselectedWidgetColor: Colors.white,
        disabledColor: Colors.white,
        brightness: Brightness.dark,
        backgroundColor: AppColors.primaryColor,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: AppColors.secondaryColor, elevation: 3),
        scaffoldBackgroundColor: AppColors.primaryColor),
    getPages: [
      GetPage(name: "/login", page: () => LoginPage()),
      GetPage(
          name: "/register_account",
          page: () => RegisterAccountPage(),
          binding: RegisterUserBiding()),
      GetPage(
          name: "/register_supplementary_data",
          page: () => RegisterSupplementaryDataPage()),
      GetPage(
        name: "/forgot_password",
        page: () => const ForgotPasswordPage(),
      ),
      GetPage(name: "/start", page: () => StartPage(), binding: StartBiding()),
      GetPage(name: "/create_team", page: () => const CreateTeamPage()),
      GetPage(name: "/join_a_team", page: () => const JoinATeamPage()),
      GetPage(
          name: "/list_workouts_by_team",
          page: () => ListWorkoutsByTeamPage(),
          binding: ManageWorkoutsByTeamBiding()),
      GetPage(
          name: "/manage_workout",
          page: () => const ManageWorkoutPage(),
          binding: ManageWorkoutsByTeamBiding()),
      GetPage(
          name: "/athlete_profile",
          page: () => AthleteProfilePage(),
          children: [
            GetPage(name: "/historic", page: () => HistoricOfAthletePage())
          ],
          binding: AthleteProfileBiding()),
      GetPage(
          name: "/manage_exercises_types",
          page: () => ManageExercisesTypesPage(),
          binding: ManageExercisesTypesBiding()),
      GetPage(
          name: "/add_exercise",
          page: () => AddExercisePage(),
          binding: AddExercisesToWorkoutBiding()),
      GetPage(
          name: "/manage_individual_workout",
          page: () => ManageIndividualWorkoutPage(),
          binding: ManageIndividualWorkoutBiding()),
      GetPage(
          name: "/update_data_user_profile",
          page: () => const UpdateDataUserPage(),
          binding: ProfileBiding())
    ],
    home: LoginPage(),
  ));
}
