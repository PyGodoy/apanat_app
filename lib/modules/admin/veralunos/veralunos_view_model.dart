import 'package:apanat_app/services/auth.service.dart';
import 'package:flutter/material.dart';

class VeralunosViewModel extends ChangeNotifier {
  // controllers
  String? nome;
  DateTime? criadoem;
  String? contato;
  bool isLoading = false;
  String? errorMessage;
  // estados
  final _authService = AuthService();
  List<dynamic> alunos = [];
  // metodos
  Future<void>carregarAlunos() async {
    try {
      isLoading = true;
      notifyListeners();

      final dados = await _authService.getAlunos();
      print('ALUNOS: $dados');
      alunos = dados;
    } catch (e) {
      errorMessage = "Erro ao carregar alunos";
    }
    
    isLoading = false;
    notifyListeners();
  }
  //dispose
  @override
  void dispose() {
    super.dispose();
    carregarAlunos();
  }
}