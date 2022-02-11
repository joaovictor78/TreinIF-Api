import 'package:flutter/material.dart';
import '/app/core/enums/user_types_enum.dart';
import '/app/core/models/logged_user_po.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/styles/app_colors.dart';

class ProfileDataCardComponent extends StatelessWidget {
  const ProfileDataCardComponent({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xff3A3B49),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 6),
        ),
      ], color: AppColors.mediumGrey, borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: "Dados pessoais",
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          LoggedUserPO.logeedUser!.user!.userType == UserTypesEnum.athlete
              ? Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                              text:
                                  "Nome: ${LoggedUserPO.logeedUser!.user!.fullName}"),
                          CustomTextWidget(text: "RG: "),
                          CustomTextWidget(text: "Curso:"),
                        ],
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(text: "Data Nasc: 00/00/0000"),
                          CustomTextWidget(text: "Tipo sanguineo: A+"),
                        ]),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                              text:
                                  "Nome: ${LoggedUserPO.logeedUser!.user!.fullName}"),
                          CustomTextWidget(
                              text: "Professor(a): Educação Fisica"),
                        ],
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
