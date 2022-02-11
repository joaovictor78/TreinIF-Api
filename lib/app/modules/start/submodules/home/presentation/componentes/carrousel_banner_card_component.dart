import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/modules/start/submodules/home/home_controller.dart';
import '/app/core/styles/app_colors.dart';

class CarrouselBannerCardComponent extends StatelessWidget {
  HomeController controller = Get.find<HomeController>();
  List listSlide = [
    {"id": 1, "image": "lib/assets/images/banner_1.png"},
    {"id": 2, "image": "lib/assets/images/banner_2.png"},
    {"id": 3, "image": "lib/assets/images/banner_3.png"}
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      color: AppColors.primaryColor,
      width: size.width,
      height: orientation != Orientation.landscape
          ? (size.height / size.width) * 90
          : (size.width / size.height) * 90,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: listSlide.length,
                controller: controller.pageController,
                onPageChanged: (value) {
                  controller.animationController.forward();
                },
                itemBuilder: (context, currentIndex) {
                  var banner = listSlide[currentIndex];
                  return Obx(() {
                    bool isSelected = banner["id"] ==
                        controller.carrouselBannerCurrentPage.value;
                    final double blur = isSelected ? 0 : 2;
                    final double offset = isSelected ? 0 : 5;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: AnimatedContainer(
                        width: size.width,
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: isSelected ? Colors.transparent : AppColors.darkGrey,
                                blurRadius: blur,
                                offset: Offset (0, offset)),
                          
                          ],
                          image: DecorationImage(
                              image: AssetImage(banner["image"].toString()),
                              fit: BoxFit.cover),
                        ),
                        duration: Duration(milliseconds: 100),
                        height: isSelected ? 20 : 5,
                      ),
                    );
                  });
                }),
          ),
          _buildBollets()
        ],
      ),
    );
  }

  Widget _buildBollets() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Obx(() {
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: listSlide.map((element) {
              bool isActivetedBollet =
                  controller.carrouselBannerCurrentPage.value ==
                      ((element["id"] as int) - 1);
              return Container(
                width: isActivetedBollet ? 15 : 10,
                height: isActivetedBollet ? 15 : 10,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: isActivetedBollet
                        ? AppColors.mediumGreen
                        : AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(30)),
              );
            }).toList());
      }),
    );
  }
}
