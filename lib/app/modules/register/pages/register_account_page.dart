import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '/app/core/components/custom_loading_indicator_widget.dart';
import '/app/core/enums/user_types_enum.dart';
import '/app/modules/register/controllers/register_user_controller.dart';
import '/app/core/components/custom_button_widget.dart';
import '/app/core/components/custom_input_widget.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/styles/app_colors.dart';

class RegisterAccountPage extends GetView<RegisterUserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: Obx(() {
        return SafeArea(
          child: Stack(
            children: [
              Visibility(
                visible: !controller.isLoading.value,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.only(top: 20, bottom: 15),
                      child: RichText(
                          text: TextSpan(
                              style: GoogleFonts.poppins(
                                  fontSize: 33, fontWeight: FontWeight.w700),
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
                        hintText: "Informe seu nome completo",
                        controller: controller.fullNameController,
                        icon: Icons.account_circle_outlined),
                    CustomInputWidget(
                        hintText: "Informe seu email",
                        controller: controller.emailController,
                        icon: Icons.email),
                    CustomInputWidget(
                        hintText: "Informe sua senha",
                        controller: controller.passwordController,
                        icon: Icons.lock_outline_rounded),
                    CustomInputWidget(
                        hintText: "Confirme sua senha",
                        controller: controller.confirmPasswordController,
                        icon: Icons.lock_outline_rounded),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(top: 8.0, left: 34),
                      child:
                          CustomTextWidget(text: "Como deseja se cadastrar?"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Radio(
                              value: UserTypesEnum.athlete.code,
                              groupValue:
                                  controller.userTypeSelected.value.code,
                              activeColor: Colors.white,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white),
                              onChanged: (int? value) {
                                controller.changeUserType(value!);
                              }),
                          CustomTextWidget(
                              text: "Atleta",
                              fontSize: 12,
                              fontWeight: FontWeight.w200),
                          Radio(
                              value: UserTypesEnum.trainer.code,
                              groupValue:
                                  controller.userTypeSelected.value.code,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white),
                              onChanged: (int? value) {
                                controller.changeUserType(value!);
                              },
                              activeColor: Colors.white),
                          CustomTextWidget(
                              text: "Treinador",
                              fontSize: 12,
                              fontWeight: FontWeight.w200)
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: CustomButtonWidget(
                          text: "CONFIRMAR",
                          onPressed: () {
                            if (controller.userTypeSelected.value.code ==
                                UserTypesEnum.athlete.code) {
                              Get.toNamed("/register_supplementary_data");
                            } else {
                              controller.registerTrainerUser();
                            }
                          },
                          padding: EdgeInsets.symmetric(horizontal: 20),
                        )),
                    Spacer(),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60))),
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: "Já tem cadastro?",
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          Container(
                              width: 200,
                              child: CustomTextWidget(
                                text:
                                    "Cadastre-se e venha participar do melhor app de treinos!",
                                textAlign: TextAlign.center,
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          OutlinedButton(
                              child: Text(
                                "Sing In",
                                style: GoogleFonts.poppins(color: Colors.black),
                              ),
                              onPressed: () {
                                Get.offNamed("login");
                              },
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      width: 1.0, color: Colors.black)))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              CustomLoadingIndicator(controller.isLoading.value)
            ],
          ),
        );
      }),
    );
  }
}
