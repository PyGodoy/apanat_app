import 'package:flutter/material.dart';
import 'package:flutter_estudo/shared/widgets/NoAccountText.dart';
import 'package:flutter_estudo/shared/widgets/app_button.dart';
import 'package:flutter_estudo/shared/widgets/app_text_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();

}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 300,
                ),
              ),
            ),
            SingleChildScrollView(
              reverse: true,
              child: Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Color(0xFF208286),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14), 
                    topRight: Radius.circular(14)
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextField(label: "Usuário", hintlabel: "Insira seu usuário"),
                    SizedBox(height: 24,),
                    AppTextField(label: "Senha", hintlabel: "********"),
                    SizedBox(height: 24,),
                    AppTextField(label: "Confirme sua senha", hintlabel: "********"),
                    SizedBox(height: 24,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: AppButton(text: 'Cadastrar', onPressed: () {}),
                    ),
                    SizedBox(height: 14,),
                    NoAccountText(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      }, 
                      text: " Login", 
                      InitialText: "Ja tem uma conta? Faça seu")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
