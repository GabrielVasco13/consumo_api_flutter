import 'package:consumo_api/app/models/message_model.dart';
import 'package:consumo_api/app/repositories/message_repositories.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MessageViewModel extends ChangeNotifier {
  final MessageRepositories messageRepositories = MessageRepositories(Dio());
  MessageModel? message;
  bool isLoading = true;
  String? errorMessage;

  MessageViewModel() {
    fetchMessage();
  }

  Future<void> fetchMessage() async {
    try {
      print('Iniciando fetchMessage');
      final fetchedMessage = await messageRepositories.getMessage();
      message = fetchedMessage;
      isLoading = false;
      print('Mensagem recebida: ${message!.advice}');
    } catch (error) {
      errorMessage = error.toString();
      isLoading = false;
      print('Erro ao buscar mensagem: $errorMessage');
    }
    notifyListeners();
  }
}
