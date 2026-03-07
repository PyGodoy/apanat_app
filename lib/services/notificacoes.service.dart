import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificacoesService {
  final Dio _dio = Dio();

  final String baseUrl = 'http://192.168.68.106:3000/api';

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
  
  Future<dynamic>getNotificacoes() async {
    try {
      final token = await getToken();
      final response = await _dio.get(
        '$baseUrl/notificacoes',
        options: Options(
          headers: {'Authorization': 'Bearer $token'}
        )
      );
      return response.data;
    } catch (e) {
      throw Exception("Erro ao buscar notificações");
    }
  }

  Future<dynamic> createNotificacao(String nomeProfessor, String descricao, String data, String horario) async {
    try {
      final token = await getToken();
      final response = await _dio.post(
        '$baseUrl/notificacoes',
        data: {
          'nome_professor': nomeProfessor,
          'descricao': descricao,
          'data': data,
          'horario': horario,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'}
        )
      );
      return response.data;
    } catch (e) {
      throw Exception("Erro ao criar notificação");
    }
  }
}