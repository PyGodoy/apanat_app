import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  //controllers
  final usuarioController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confsenhaController = TextEditingController();
  //estados
  bool isLoading = false;
  String? errorMessage;
  //metodos
  Future<void>register(BuildContext context) async {
    final usuario = usuarioController.text.trim();
    final email = emailController.text.trim();
    final senha = senhaController.text.trim();
    final confSenha = confsenhaController.text.trim();

    if (usuario.isEmpty || email.isEmpty || senha.isEmpty || confSenha.isEmpty ) {
      errorMessage = "Preencha todos os campos";
      notifyListeners();
      return;
    }

    if (senha != confSenha) {
      errorMessage = "Senhas não coincidem";
      notifyListeners();
      return;
    }

    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    isLoading = false;
    notifyListeners();

    if(context.mounted) {
      Navigator.pushNamed(context, "/login");
    }
  }

  void limpaErro() {
    errorMessage = null;
    notifyListeners();
  }

  //dispose
  void dispose() {
    usuarioController.dispose();
    emailController.dispose();
    senhaController.dispose();
    confsenhaController.dispose();
    super.dispose();
  }
}