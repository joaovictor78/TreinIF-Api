import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/app/core/components/custom_button_widget.dart';
import '/app/core/components/custom_input_widget.dart';
import '/app/core/styles/app_images.dart';
import '/app/core/styles/app_colors.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: AppColors.primaryColor,
    title: Text("Esqueci minha senha", style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500, color: Colors.white)),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(AppImages.logoLight),
      )
    ],
      ),
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
                  Text("Alterar senha", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: Text("Digite seu endereço de email cadastrado e enviaremos um email com um link para a redefinição da senha", textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 12, color: Colors.white)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.vpn_key_rounded, color: Colors.white),
                      Icon(Icons.lock_outline_rounded,  color: Colors.white)
                    ],
                    
                  ),
            

                ],
                ),
              ),
            ),
          ),
         CustomInputWidget(hintText: "Email", icon: Icons.email_outlined, horizontalPadding: 17),
          SizedBox(
            height: 40,
          ),
          CustomButtonWidget(text: "Solicitar redefinição de senha", color: AppColors.secondaryColor)
        ],
      ),
      
    );
  }
}