import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '/app/core/components/custom_loading_indicator_widget.dart';
import '/app/modules/login/controllers/login_controller.dart';
import '/app/core/components/custom_button_widget.dart';
import '/app/core/components/custom_input_widget.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/styles/app_colors.dart';
import '/app/core/styles/app_images.dart';
import '/app/modules/login/components/wive_widget.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() {
          return SafeArea(
              child: Container(
            color: controller.isLoading.value
                ? AppColors.primaryColor
                : Colors.white,
            child: Stack(
              children: [
                Visibility(
                  visible: !controller.isLoading.value,
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          child: WaveWidget(
                            size: size,
                            yOffset: size.height / 3.9,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 140),
                          width: size.width,
                          height: size.height,
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Image.asset(AppImages.logo,
                                      height: 100, width: 100),
                                  DefaultTextStyle(
                                    style: GoogleFonts.poppins(
                                        fontSize: 40,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                    child: AnimatedTextKit(
                                      animatedTexts: [
                                        WavyAnimatedText('TreinIF'),
                                      ],
                                      isRepeatingAnimation: false,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RichText(
                                    text: TextSpan(
                                        style: GoogleFonts.poppins(
                                            fontSize: 33,
                                            fontWeight: FontWeight.w700),
                                        text: "Sign",
                                        children: [
                                      TextSpan(
                                          text: "In",
                                          style: GoogleFonts.poppins(
                                              fontSize: 33,
                                              color: AppColors.secondaryColor,
                                              fontWeight: FontWeight.w700)),
                                    ])),
                              ),
                              CustomInputWidget(
                                  hintText: "Informe seu email",
                                  controller: controller.emailController,
                                  icon: Icons.account_circle_rounded),
                              CustomInputWidget(
                                  hintText: "Informe sua senha",
                                  controller: controller.passwordController,
                                  icon: Icons.lock),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 40, top: 8, bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomTextWidget(
                                        text: "Esqueceu sua senha? "),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed("/forgot_password");
                                      },
                                      child: CustomTextWidget(
                                          text: "Recuperar",
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              CustomButtonWidget(
                                  text: "Entrar",
                                  onPressed: () {
                                    controller.authenticate();
                                  },
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 40)),
                              Spacer(),
                              Container(
                                color: AppColors.primaryColor,
                                padding: EdgeInsets.only(bottom: 40),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomTextWidget(
                                        text: "Ainda não tem cadastro?"),
                                    SizedBox(width: 2),
                                    GestureDetector(
                                        onTap: () {},
                                        child: CustomTextWidget(
                                            text: "Criar",
                                            fontWeight: FontWeight.w700)),
                                    SizedBox(width: 10),
                                    SizedBox(
                                        height: 30,
                                        width: 50,
                                        child: CustomButtonWidget(
                                          child: Icon(Icons.arrow_forward,
                                              color: Colors.white, size: 16),
                                          color: AppColors.secondaryColor,
                                          onPressed: () {
                                            Get.toNamed("/register_account");
                                          },
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                    child: CustomLoadingIndicator(controller.isLoading.value))
              ],
            ),
          ));
        }));
  }
}
