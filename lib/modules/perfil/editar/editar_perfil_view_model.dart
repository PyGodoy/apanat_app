import 'package:apanat_app/services/auth.service.dart';
import 'package:flutter/foundation.dart';

class EditarPerfilViewModel extends ChangeNotifier{
  // controllers
  String? foto;
  String? usuario;
  String? email;
  String? telefone;
  String? errorMessage;
  bool isLoading = false;
  // estados
  final _authService = AuthService();
  // metodos
  Future<void>carregarPerfil() async {
    
    isLoading = true;
    notifyListeners();
    try {
      final dados = await _authService.getPerfil();
      foto = dados['foto'];
      usuario = dados['usuario'];
      email = dados['email'];
      telefone = dados['telefone'];
    } catch (e) {
      errorMessage = "Não foi possível carregar dados do perfil";
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void>salvarPerfil(String usuario, String email, String telefone) async {
    print("CHAMANDO PUT");
    isLoading = true;
    notifyListeners();
    try {
      await _authService.putPerfil(usuario, email, telefone, foto ?? "");
      print("PUT FINALIZADO");
      await carregarPerfil();
    } catch (e) {
      errorMessage = "Erro ao salvar perfil";
    }
    isLoading = false;
    notifyListeners();
  }
  // dispose
}