import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import '/app/modules/start/submodules/home/presentation/componentes/carrousel_banner_card_component.dart';
import '/app/modules/start/submodules/home/presentation/componentes/square_with_rounded_border_card_component.dart';
import '/app/core/styles/app_colors.dart';
import '/app/domain/entitities/athlete_entity.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/modules/start/submodules/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.animationController.forward();
    log(controller.carrouselBannerCurrentPage.toString());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            buildBody(context),
            buildFloatingSearchBar(context),
          ],
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Padding(
      padding: EdgeInsets.only(
          top: orientation != Orientation.landscape
              ? (size.height / size.width) * 40
              : (size.width / size.height) * 40,
          left: 7,
          right: 7),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CarrouselBannerCardComponent(),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SquareWithRoundedBorderCardComponent(
                  iconData: Icons.history_edu_rounded,
                  title: "Historico dos meus atletas"),
              SizedBox(width: 4),
              SquareWithRoundedBorderCardComponent(
                  onTap: (){
                    Get.toNamed("/manage_exercises_types");
                  },
                  iconData: Icons.sports_basketball_rounded,
                  title: "Gerenciar tipos de exercicios")
            ])
          ],
        ),
      ),
    );
  }

  Widget buildFloatingSearchBar(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search...',
      hintStyle: GoogleFonts.poppins(color: Colors.white),
      scrollPadding: const EdgeInsets.only(top: 0, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        controller.searchAthletes(query);
      },
      transition: CircularFloatingSearchBarTransition(),
      automaticallyImplyBackButton: false,
      leadingActions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.search_sharp),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      actions: [],
      builder: (context, transition) {
        return Obx(
          () => Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Material(
              color: Colors.transparent,
              child: ListView.builder(
                itemCount: controller.athletes.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  AthleteEntity athlete = controller.athletes[index];
                  return ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    tileColor: AppColors.mediumGrey,
                    onTap: () {
                      Get.toNamed("/athlete_profile", arguments: athlete);
                    },
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(athlete.avatarUrl ?? ""),
                      backgroundColor: Colors.transparent,
                    ),
                    title: CustomTextWidget(text: athlete.name ?? ""),
                    subtitle: CustomTextWidget(text: athlete.email ?? ""),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
