import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '/app/core/components/custom_loading_indicator_widget.dart';
import '/app/core/models/course_model.dart';
import '/app/modules/register/controllers/register_user_controller.dart';
import '/app/core/components/custom_button_widget.dart';
import '/app/core/components/custom_drop_down_widget.dart';
import '/app/core/components/custom_input_widget.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/styles/app_colors.dart';

class RegisterSupplementaryDataPage extends StatelessWidget {
  RegisterUserController controller = Get.find<RegisterUserController>();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: controller.selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != controller.selectedDate.value) {
      controller.selectedDate.value = picked;
      controller.birthDate.value = controller.selectedDate.value.toString().substring(0,10);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Obx(() {
          return Stack(
            children: [
              Visibility(
                visible: !controller.isLoading.value,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                              text: TextSpan(
                                  style: GoogleFonts.poppins(
                                      fontSize: 28, fontWeight: FontWeight.w700),
                                  text: "Sign",
                                  children: [
                                TextSpan(
                                    text: "In",
                                    style: GoogleFonts.poppins(
                                        fontSize: 28,
                                        color: AppColors.secondaryColor,
                                        fontWeight: FontWeight.w700)),
                              ])),
                        ),
                        CustomTextWidget(
                            text:
                                "Estamos quase finalizando, preencha só mais algumas informações: ",
                            textAlign: TextAlign.left),
                        CustomInputWidget(
                            hintText: "Informe seu CPF",
                            controller: controller.CPFController,
                            horizontalPadding: 0,
                            icon: Icons.featured_play_list_outlined),
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
                              controller.selectedCourse.value = course as CourseModel;
                            },
                            hint:controller.selectedCourse.value?.name == null ?  Text("Selecione seu curso") : Text(controller.selectedCourse.value!.name!),
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
                                          value: data 
                                        ))
                                    .toList()),
                        _space(),
                        CustomInputWidget(
                            hintText: "Informe seu RG",
                            controller: controller.RGController,
                            horizontalPadding: 0,
                            icon: Icons.featured_play_list_outlined),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: CustomTextWidget(
                                text: "Selecione seu tipo sanguíneo:")),
                        _space(),
                        CustomDropdownButton(
                          margin: EdgeInsets.only(left: 30, right: 200, top: 10),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Icon(Icons.bloodtype_outlined,
                                color: AppColors.primaryColor),
                          ),
                          dropdownColor: Colors.yellow,
                          value: null,
                          onChanged: (String? blood){
                            controller.selectedBlood.value = blood!;
                          },
                          style: GoogleFonts.poppins(fontSize: 14),
                          isDense: true,
                          hint:  controller.selectedBlood.value == ""  ?  Text("Ex: +A") : Text(controller.selectedBlood.value),
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
                        _space(),
                        CustomTextWidget(text: "Selecione sua data de nascimento: "),
                        _space(),
                        birthdayCard(context, controller.selectedDate.value.toString().substring(0,10), ( ){
                          _selectDate(context);
                        }),
                        _space(),
                        _space(),
                        _space(),
                        _space(),
                        _space(),
                        _space(),
                        Container(
                          alignment: Alignment.center,
                          child: CustomButtonWidget(
                            text: "CADASTRAR",
                            onPressed: (){
                              controller.registerAthleteUser();
                            },
                            padding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              CustomLoadingIndicator(controller.isLoading.value)
            ],
          );
        }),
      ),
    );
  }
}

Widget _space() {
  return SizedBox(
    height: 8,
  );
}

Widget birthdayCard(
    BuildContext context, String dateSelected,  void Function() onPressed) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
        width: 150,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: GestureDetector(
            onTap: () {
              onPressed();
            },
            child: Row(
              children: [
                Text(
                 dateSelected,
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.calendar_today_rounded,
                      color: AppColors.primaryColor),
                )
              ],
            ))),
  );
}
