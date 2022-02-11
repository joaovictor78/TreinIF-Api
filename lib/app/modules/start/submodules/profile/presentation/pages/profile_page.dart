import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/core/models/logged_user_po.dart';
import '/app/modules/start/submodules/profile/presentation/components/profile_data_card_component.dart';
import '/app/core/components/custom_paint_widget.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/styles/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 1.4, color: AppColors.lightGrey)),
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              width: size.width * 0.5,
              child: CustomTextWidget(
                text: "LOG OUT",
                textAlign: TextAlign.center,
              )),
          onPressed: () {},
        ),
        body: SafeArea(
          child: LayoutBuilder(builder: (context, constrains) {
            return Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: constrains.maxHeight * .43,
                        child: CustomPaintWidget(
                          child: Column(children: [
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              alignment: Alignment.center,
                              child: CustomTextWidget(
                                  text: "Meu Perfil",
                                  fontSize: 19,
                                  color: AppColors.primaryColor),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Container(
                                alignment: Alignment.center,
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: const Color(0xff7c94b6),
                                  image: LoggedUserPO.logeedUser!.user!
                                              .profileAvatarURL ==
                                          ""
                                      ? null
                                      : DecorationImage(
                                          image: NetworkImage(LoggedUserPO
                                                  .logeedUser!
                                                  .user!
                                                  .profileAvatarURL ??
                                              ""),
                                          fit: BoxFit.cover,
                                        ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50.0)),
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                    width: 4.0,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(child: Container()),
                            const ProfileDataCardComponent(),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: OutlinedButton(
                            onPressed: () {
                              Get.toNamed("/update_data_user_profile");
                            },
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(2),
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.mediumGrey),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextWidget(text: "Editar Perfil"),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
        ));
  }
}
