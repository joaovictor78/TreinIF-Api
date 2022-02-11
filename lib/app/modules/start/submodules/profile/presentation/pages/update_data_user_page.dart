import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '/app/core/components/custom_button_widget.dart';
import '/app/core/models/logged_user_po.dart';
import '/app/domain/entitities/course_entity.dart';
import '/app/core/components/custom_drop_down_widget.dart';
import '/app/core/components/custom_input_widget.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/components/custom_back_button_widget.dart';
import '/app/core/styles/app_colors.dart';
import '/app/modules/start/submodules/profile/controllers/update_data_user_controller.dart';

class UpdateDataUserPage extends GetView<UpdateDataUserController> {
  const UpdateDataUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: CustomBackButtonWidget()),
        body: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 16),
              child: CustomTextWidget(
                text: "Editar meu perfil",
                fontSize: 19,
                textAlign: TextAlign.center,
              ),
            ),
            Positioned.fill(
              top: 60,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              child: CircleAvatar(
                                radius: 47,
                                backgroundImage: NetworkImage(LoggedUserPO
                                    .logeedUser!.user!.profileAvatarURL!),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 3,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.secondaryColor,
                                        border: Border.all(
                                            color: Colors.white, width: 2),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(Icons.photo_camera, size: 16),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                      CustomInputWidget(
                          hintText: "Informe seu nome completo",
                          horizontalPadding: 0,
                          controller: TextEditingController(),
                          icon: Icons.account_circle_outlined),
                      _space(),
                      CustomDropdownButton(
                          onClicked: () {
                            controller.getAllCourses();
                          },
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Icon(Icons.school_rounded,
                                color: AppColors.primaryColor),
                          ),
                          dropdownColor: Colors.yellow,
                          value: null,
                          style: GoogleFonts.poppins(fontSize: 14),
                          isDense: true,
                          onChanged: (course) {
                            controller.selectedCourse.value =
                                course as CourseEntity;
                          },
                          hint: controller.selectedCourse.value?.name == null
                              ? Text("Selecione seu curso")
                              : Text(controller.selectedCourse.value!.name!),
                          items: controller.listAllCourses.value == null
                              ? [
                                  DropdownMenuItem(
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                ]
                              : controller.listAllCourses.value
                                  .map((data) => DropdownMenuItem(
                                      child: Text(
                                        data.name!,
                                      ),
                                      value: data))
                                  .toList()),
                      _space(),
                      CustomInputWidget(
                          hintText: "Informe seu CPF",
                          controller: controller.CPFController,
                          horizontalPadding: 0,
                          icon: Icons.featured_play_list_outlined),
                      CustomInputWidget(
                          hintText: "Informe seu RG",
                          controller: controller.RGController,
                          horizontalPadding: 0,
                          icon: Icons.featured_play_list_outlined),
                      _space(),
                      CustomDropdownButton(
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(Icons.bloodtype_outlined,
                              color: AppColors.primaryColor),
                        ),
                        dropdownColor: Colors.yellow,
                        value: null,
                        onChanged: (String? blood) {
                          controller.selectedBlood.value = blood!;
                        },
                        style: GoogleFonts.poppins(fontSize: 14),
                        isDense: true,
                        hint: controller.selectedBlood.value == ""
                            ? Text("Ex: +A")
                            : Text(controller.selectedBlood.value),
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "A+",
                            ),
                            value: "A+",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "A-",
                            ),
                            value: "A-",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "B+",
                            ),
                            value: "B+",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "B-",
                            ),
                            value: "B-",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 18, right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButtonWidget(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CustomTextWidget(
                          text: "Salvar",
                          fontSize: 16,
                        ),
                      ),
                      color: AppColors.mediumGreen,
                      onPressed: () {},
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                    ),
                    CustomButtonWidget(
                      text: "Cancelar",
                      color: AppColors.red,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget _space() {
    return SizedBox(height: 8);
  }
}
