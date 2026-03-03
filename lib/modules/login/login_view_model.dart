import 'package:flutter/material.dart';
import 'package:apanat_app/services/auth.service.dart';

class LoginViewModel extends ChangeNotifier {
  final _authService = AuthService();
  // Controllers
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  // Estados
  bool isLoading = false;
  String? errorMessage;

  // Métodos
  Future<void> login(BuildContext context) async {
    final email = emailController.text.trim();
    final senha = senhaController.text.trim();

    if (email.isEmpty || senha.isEmpty ) {
      errorMessage = 'Preencha o Email e Senha';
      notifyListeners();
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      await _authService.login(email, senha);
      if (context.mounted) {
        Navigator.pushNamed(context, "/home");
      }
    }
    catch (e) {
      print('ERRO LOGIN: $e');
      errorMessage = "Usuario e Senha Incorretos";
    }

    isLoading = false;
    notifyListeners();
  }

  void limparErro() {
    errorMessage = null;
    notifyListeners();
  }

  // Dispose
  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }
}