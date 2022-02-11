import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/app/core/components/custom_button_widget.dart';
import '/app/core/components/custom_input_widget.dart';
import '/app/core/components/custom_back_button_widget.dart';
import '/app/core/styles/app_colors.dart';

class JoinATeamPage extends StatelessWidget {
  const JoinATeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: CustomBackButtonWidget(color: Colors.white)),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(10),
            child: Card(
              color: AppColors.darkGrey,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text("Entrar no Time",
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: Text(
                          "Digite o código disponibilizado pelo professor, para entrar no time.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: Colors.white)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sports_baseball_rounded,
                            color: Colors.white),
                        Icon(Icons.group_add_rounded, color: Colors.white)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          CustomInputWidget(
              hintText: "Informe o Codigo",
              icon: Icons.copy_rounded,
              horizontalPadding: 17),
          SizedBox(
            height: 40,
          ),
          CustomButtonWidget(
              text: "Entrar na equipe", color: AppColors.secondaryColor)
        ],
      ),
    );
  }
}
