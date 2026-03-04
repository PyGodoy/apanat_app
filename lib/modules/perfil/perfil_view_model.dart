import 'package:apanat_app/services/auth.service.dart';
import 'package:flutter/material.dart';

class PerfilViewModel extends ChangeNotifier{

  // controllers
  String? foto;
  String? usuario;
  String? email;
  String? telefone;
  bool isLoading = false;
  String? errorMessage;
  int checkInsMes = 0;
  int totalAulasUser = 0;
  // estados
  final _authService = AuthService();
  // metodos
  Future<void>perfil() async {
    
    isLoading = true;
    notifyListeners();    
    try {
      final dados = await _authService.getPerfil();
      final checkins = await _authService.getCheckinsMes();
      final totalAulas = await _authService.getTotalAulas();
      totalAulasUser = totalAulas['total'];
      checkInsMes = checkins['total'];
      foto = dados['foto'];
      usuario = dados['usuario'];
      email = dados['email'];
      telefone = dados['telefone'];
      notifyListeners();
    } catch (e) {
      errorMessage = "Erro ao carregar perfil";
    }
    isLoading = false;
    notifyListeners();
  }
  // dispose
  @override
  void dispose() {
    super.dispose();
    perfil();
  }
}