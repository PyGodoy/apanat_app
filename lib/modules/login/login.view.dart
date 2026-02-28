import 'package:flutter/material.dart';
import 'package:flutter_estudo/shared/widgets/NoAccountText.dart';
import 'package:flutter_estudo/shared/widgets/app_button.dart';
import 'package:flutter_estudo/shared/widgets/app_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();

}

class _LoginViewState extends State<LoginView> {
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
                    SizedBox(height: 14,),
                    AppButton(
                      text: "Entrar", onPressed:() {
                      print("Botão clicado");
                      },
                    ),
                    NoAccountText(
                      InitialText: "Não tem uma Conta? ",
                      text: " Cadastre-se",
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                    ),
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
