import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '/app/modules/start/submodules/home/presentation/home_page.dart';
import '/app/modules/start/submodules/profile/presentation/pages/profile_page.dart';
import '/app/modules/start/submodules/workouts/presentation/pages/workouts_page.dart';
import '/app/core/enums/user_types_enum.dart';
import '/app/core/styles/app_colors.dart';
import '/app/core/styles/app_icons.dart';
import '/app/modules/start/start_controller.dart';

class StartPage extends GetView<StartController> {
  bool isAthlete = (Get.arguments as UserTypesEnum) == UserTypesEnum.athlete;
  @override
  Widget build(BuildContext context) {
    var pages = [
      HomePage(),
      WorkoutsPage(Get.arguments),
      ProfilePage(),
      Container()
    ];
    isAthlete ? pages.removeAt(0) : null;
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.pageChanged,
        children: pages,
      ),
      bottomNavigationBar: AnimatedBuilder(
        builder: (context, snapshot) {
          var listTabBarsAsTrainer = [
            _navBarItem(
                url: AppIcons.homeIcon,
                index: 0,
                label: "home",
                activeState: true),
            _navBarItem(url: AppIcons.trainingIcon, index: 1, label: "treinos"),
            _navBarItem(
                url: AppIcons.profileIcon, index: 2, label: "meu perfil"),
            _navBarItem(
                url: AppIcons.informationIcon, index: 3, label: "informações"),
          ];
          var listTabBarsAsAthlete = [
            _navBarItem(url: AppIcons.trainingIcon, index: 0, label: "treinos"),
            _navBarItem(
                url: AppIcons.profileIcon, index: 1, label: "meu perfil"),
            _navBarItem(
                url: AppIcons.informationIcon, index: 2, label: "informações"),
          ];
          return BottomNavigationBar(
              currentIndex: controller.currentIndex,
              onTap: controller.pageChanged,
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.mediumGrey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: AppColors.secondaryColor,
              unselectedItemColor: Colors.white,
              selectedLabelStyle: GoogleFonts.poppins(),
              unselectedLabelStyle: GoogleFonts.poppins(),
              items: isAthlete ? listTabBarsAsAthlete : listTabBarsAsTrainer);
        },
        animation: controller.pageController,
      ),
    );
  }

  BottomNavigationBarItem _navBarItem(
      {required String url,
      int index = 0,
      required String label,
      bool? activeState = false}) {
    bool isActive = controller.currentIndex == index ? true : false;
    return BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ImageIcon(AssetImage(url),
              color: isActive ? AppColors.secondaryColor : Colors.white),
        ),
        label: label);
  }
}
