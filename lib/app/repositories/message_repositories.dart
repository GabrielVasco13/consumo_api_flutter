import 'package:consumo_api/app/models/message_model.dart';
import 'package:dio/dio.dart';

class MessageRepositories {
  MessageRepositories(this.dio);

  final Dio dio;
  final String _url = 'https://api.adviceslip.com/advice';

  Future<MessageModel> getMessage() async {
    try {
      print('Iniciando requisição para $_url');
      final response = await dio.get(_url);

      if (response.statusCode == 200) {
        print('Resposta recebida: ${response.data}');
        final slip = response.data['slip'] as Map<String, dynamic>;
        return MessageModel.fromJson(slip);
      } else {
        throw Exception(
            'Erro ao obter a mensagem: Código ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      print('Erro de Dio: ${dioError.message}');
      throw Exception('Erro ao fazer a requisição: ${dioError.message}');
    } catch (error) {
      print('Erro inesperado: $error');
      throw Exception('Erro inesperado: $error');
    }
  }
}
