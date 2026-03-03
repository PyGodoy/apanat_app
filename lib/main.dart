import 'package:apanat_app/modules/historico/historico_view.dart';
import 'package:apanat_app/modules/home/home_view.dart';
import 'package:apanat_app/modules/notificacoes/notificacoes_view.dart';
import 'package:apanat_app/modules/perfil/editar/editar_perfil_view.dart';
import 'package:apanat_app/modules/perfil/perfil_view.dart';
import 'package:flutter/material.dart';
import 'package:apanat_app/modules/login/login_view.dart';
import 'package:apanat_app/modules/register/register_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 34, 34, 34),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginView(),
        '/register': (context) => const RegisterView(),
        '/home' : (context) => const HomeView(),
        '/historico' : (context) => HistoricoView(),
        '/notificacoes' : (context) => NotificacoesView(),
        '/perfil' : (context) => PerfilView(),
        '/editarperfil' : (context) => EditarPerfilView(),
      },
    );
  }
}