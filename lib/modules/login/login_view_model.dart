import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
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

    await Future.delayed(Duration(seconds: 2));

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