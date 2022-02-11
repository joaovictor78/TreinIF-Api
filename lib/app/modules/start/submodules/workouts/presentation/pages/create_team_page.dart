import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '/app/modules/start/submodules/workouts/controllers/create_team_controller.dart';
import '/app/core/components/custom_button_widget.dart';
import '/app/core/components/custom_drop_down_widget.dart';
import '/app/core/components/custom_input_widget.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/styles/app_colors.dart';

class CreateTeamPage extends GetView<CreateTeamController> {
  const CreateTeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
      ),
      body: SafeArea(
        child: Obx(() {
          return Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomTextWidget(text: "Criar Equipe: ", fontSize: 21),
                      CustomTextWidget(text: "#", fontSize: 21),
                      CustomTextWidget(
                          text: controller.code.value.code ?? "",
                          fontSize: 19,
                          fontWeight: FontWeight.w200)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputWidget(
                      controller: controller.teamNameController,
                      hintText: "Informe o nome do grupo",
                      horizontalPadding: 0,
                      icon: Icons.group_sharp),
                  const SizedBox(
                    height: 4,
                  ),
                  CustomDropdownButton(
                      onChanged: (value) {
                        controller.modality = value;
                      },
                      hint: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: CustomTextWidget(
                            text: controller.modality.value.name ??
                                "Selecione a modalidade",
                            fontSize: 14),
                      ),
                      prefixIcon: const Icon(Icons.sports_handball_rounded,
                          color: Colors.white),
                      items: controller.modalities
                          .map((element) => DropdownMenuItem(
                              value: element,
                              child:
                                  CustomTextWidget(text: element.name ?? "")))
                          .toList()),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLines: 4,
                    controller: controller.teamDescriptionController,
                    style: GoogleFonts.poppins(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      hintText: "Descrição do equipe (Opcional)",
                      hintStyle: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 14),
                      prefixIcon: Container(
                        margin: const EdgeInsets.only(bottom: 50),
                        child: const Icon(
                          Icons.mode_comment_rounded,
                          color: Colors.white,
                        ),
                      ),
                      filled: true,
                      isDense: true,
                      fillColor: AppColors.lightGrey,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButtonWidget(
                    text: "CRIAR",
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    onPressed: () {
                      controller.createTeam();
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
