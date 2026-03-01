import 'dart:ffi';

import 'package:apanat_app/modules/register/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:apanat_app/shared/widgets/NoAccountText.dart';
import 'package:apanat_app/shared/widgets/app_button.dart';
import 'package:apanat_app/shared/widgets/app_text_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();

}

class _RegisterViewState extends State<RegisterView> {
  final RegisterViewModel _viewModel = RegisterViewModel();
  @override
  void initState() {
    super.initState();
    _viewModel.addListener(() {
      setState(() {
      });
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
                children: [
                  SizedBox(height: 20,),
                  Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                  ),
                  Text(
                    "Bem-Vindo a Apanat",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(height: 5,),
                Text(
                  "Faça o cadastro para acessar o sistema",
                  style: TextStyle(
                    fontSize: 12,
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
                      label: "Usuário", 
                      hintlabel: "Insira seu usuário",
                      controller: _viewModel.usuarioController,
                      onChanged: (_) => _viewModel.limpaErro(),
                    ),
                    SizedBox(height: 24,),
                    AppTextField(
                      label: "E-mail", 
                      hintlabel: "Insira seu E-mail",
                      controller: _viewModel.emailController,
                      onChanged: (_) => _viewModel.limpaErro(),
                    ),
                    SizedBox(height: 24,),
                    AppTextField(
                      label: "Senha", 
                      hintlabel: "********",
                      controller: _viewModel.senhaController,
                      onChanged: (_) => _viewModel.limpaErro() ,
                    ),
                    SizedBox(height: 24,),
                    AppTextField(
                      label: "Confirme sua senha", 
                      hintlabel: "********",
                      controller: _viewModel.confsenhaController,
                      onChanged: (_) => _viewModel.limpaErro(),
                    ),
                    SizedBox(height: 24,),
                    if (_viewModel.errorMessage != null)
                    Padding(
                      padding: EdgeInsets.only(bottom: 14),
                      child: Text(
                        _viewModel.errorMessage!,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: _viewModel.isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : AppButton(
                        text: 'Cadastrar',
                        onPressed: () => _viewModel.register(context),
                      ),
                    ),
                    SizedBox(height: 14,),
                    NoAccountText(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      }, 
                      text: " Login", 
                      InitialText: "Ja tem uma conta? Faça seu"
                    ),
                    SizedBox(height: 24,),
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
