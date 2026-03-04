import 'package:apanat_app/services/notificacoes.service.dart';
import 'package:flutter/material.dart';

class NotificacoesViewModel extends ChangeNotifier{

  // controllers
  String? nomeProfessor;
  String? descricao;
  DateTime? date;
  String? horario;
  bool isLoading = false;
  String? errorMessage;

  // estados´
  final _notificacoesService = NotificacoesService();
  List<dynamic> notificacoes = [];

  // metodos
  Future<void>carregarNotificacoes() async {
    try {

      isLoading = true;
      notifyListeners();

      final dados = await _notificacoesService.getNotificacoes();
      notificacoes = dados;

    } catch (e) {
      errorMessage = "Erro ao carregar notificações";
    }

    isLoading = false;
    notifyListeners();
  }
  // dispose
  @override
  void dispose() {
    super.dispose();
    carregarNotificacoes();
  }
}