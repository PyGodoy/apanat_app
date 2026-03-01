import 'package:apanat_app/modules/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:apanat_app/shared/widgets/NoAccountText.dart';
import 'package:apanat_app/shared/widgets/app_button.dart';
import 'package:apanat_app/shared/widgets/app_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();

}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = LoginViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                ),
                SizedBox(height: 14,),
                Text(
                  "Bem-Vindo a Apanat",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 14,),
                Text(
                  "Faça o Login para acessar o sistema",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white
                    ),
                  ),
                ],
              ),
            ),  
            SingleChildScrollView(
              reverse: true,
                child: Container(
                  padding: EdgeInsets.all(14),
                  width: double.infinity,
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
                    AppTextField(
                      label: "E-mail", 
                      hintlabel: "Insira seu E-mail", 
                      controller: _viewModel.emailController,
                      onChanged: (_) => _viewModel.limparErro(),
                    ),
                    SizedBox(height: 24,),
                    AppTextField(
                      label: "Senha", 
                      hintlabel: "********", 
                      controller: _viewModel.senhaController,
                      onChanged:(_) => _viewModel.limparErro(),
                    ),
                    SizedBox(height: 24,),
                    if (_viewModel.errorMessage != null)
                    Padding(
                      padding: EdgeInsets.only(bottom: 24),
                      child: Text(
                        _viewModel.errorMessage!,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: _viewModel.isLoading
                        ? CircularProgressIndicator(color: Colors.white,)
                        : AppButton(
                        text: 'Entrar', 
                        onPressed: () => _viewModel.login(context)
                      ),
                    ),
                    SizedBox(height: 14,),
                    NoAccountText(
                      InitialText: "Não tem uma Conta? ",
                      text: " Cadastre-se",
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                    ),
                    SizedBox(height: 24,)
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
