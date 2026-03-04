import 'package:apanat_app/services/auth.service.dart';
import 'package:flutter/material.dart';

class HistoricoViewModel extends ChangeNotifier{
  // controllers
  final _authService = AuthService();
  
  List<dynamic> historico = [];
  bool isLoading = false;
  String? errorMessage;
  
  // metodos
  Future<void>carregarHistorico() async {
    
    isLoading = true;
    notifyListeners();
    
    try {
      final dados = await _authService.getHistorico();
      historico = dados;
      notifyListeners();
    } catch(e) {
      errorMessage = "Erro ao carregar histórico";
    }

    isLoading = false;
    notifyListeners();
  }

  // dispose
  @override
  void dispose() {
    super.dispose();
    carregarHistorico();
  }
}