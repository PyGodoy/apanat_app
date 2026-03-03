import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio _dio = Dio();

  final String baseUrl = 'http://10.0.2.2:3000/api';

  Future<dynamic> cadastrar(String usuario, String email, String senha) async {
    try {
      final response = await _dio.post(
        '$baseUrl/users',
        data: {
          'usuario' : usuario,
          'email' : email,
          'senha' : senha,
        }
      );
      return response.data;
    }
    catch (e) {
      print('ERRO: $e');
      throw Exception('Erro ao cadastrar: $e');
    }
  }

  Future<dynamic> login(String email, String senha) async {
    try {
      final response = await _dio.post(
        '$baseUrl/users/login',
        data: {
          "email" : email,
          "senha" : senha
        }
      );

      final token = response.data['token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      print('TOKEN SALVO: $token');
      return response.data;
    }
    catch (e) {
      throw Exception("Erro ao realizar login: $e");
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<dynamic>getUsers() async {
    try {
      final token = await getToken();
      print('TOKEN ENVIADO: $token');

      final response = await _dio.get(
        '$baseUrl/users',
        options: Options(
          headers: {"Authorization": 'Bearer $token'},
        ),
      );
      return response.data;
    } 
    catch (e) {
      throw Exception("Erro ao buscar usuarios: $e");
    }
  }

  Future<dynamic>getPerfil() async {
    try {
      final token = await getToken();
      final response = await _dio.get(
        '$baseUrl/users/perfil',
        options: Options(
          headers: {'Authorization': 'Bearer $token'}
        )
      );
      return response.data;
    }
    catch (e) {
      throw Exception("Erro ao buscar dados do perfil");
    }
  }

  Future<dynamic>putPerfil(String usuario, String email, String telefone, String foto) async {
    try {
      final response = await _dio.put(
        '$baseUrl/users/perfil',
        data: {
          'usuario': usuario,
          'email' : email,
          'telefone': telefone,
          'foto': foto,
        },
        options: Options(
          headers: {'Authorization': 'Bearer ${await getToken()}'}
        )
      );
      return response.data;
    } catch (e) {
      print("ERRO REAL DO DIO: $e");
      rethrow;
    }
  }
}