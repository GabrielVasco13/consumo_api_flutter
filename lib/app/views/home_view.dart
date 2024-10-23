import 'package:consumo_api/app/repositories/message_repositories.dart';
import 'package:consumo_api/app/view_model/message_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final MessageRepositories messageRepositories = MessageRepositories(Dio());

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MessageViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Consumo de API'),
        ),
        body: Center(
          child: Consumer<MessageViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.isLoading) {
                return const CircularProgressIndicator();
              } else if (viewModel.errorMessage != null) {
                return Text('Erro: ${viewModel.errorMessage}');
              } else if (viewModel.message != null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Mensagem do dia:',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      viewModel.message!.advice,
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              } else {
                return const Text('Nenhuma mensagem disponível.');
              }
            },
          ),
        ),
      ),
    );
  }
}
