import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/app/domain/entitities/athlete_entity.dart';
import '/app/core/components/custom_text_widget.dart';
import '/app/core/styles/app_colors.dart';

class AthleteDataCardComponent extends StatelessWidget {
  AthleteDataCardComponent(this._athleteEntity);
  AthleteEntity _athleteEntity;
  @override
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
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextWidget(
            text: "Dados pessoais",
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(text: "CPF: ${_athleteEntity.cpf}"),
                    CustomTextWidget(text: "RG: ${_athleteEntity.rg}"),
                    CustomTextWidget(
                        text: "Curso: ${_athleteEntity.course?.name}"),
                  ],
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                CustomTextWidget(text: "Data Nasc: 00/00/0000"),
                CustomTextWidget(text: "Tipo sanguineo: A+"),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
