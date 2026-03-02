import 'package:apanat_app/shared/models/notification_model.dart';
import 'package:apanat_app/shared/widgets/app_bar.dart';
import 'package:apanat_app/shared/widgets/app_button_nav_bar.dart';
import 'package:apanat_app/shared/widgets/notification_card.dart';
import 'package:flutter/material.dart';

class NotificacoesView extends StatefulWidget{
  
  @override
  State<NotificacoesView> createState() => _NotificacoesView();

}

  class _NotificacoesView extends State<NotificacoesView> {
    int _indiceSelecionado = 2;
    final List<NotificationModel> notificacoes = [
      NotificationModel(
        nome: "Vivianne Alves", 
        descricao: "Não teremos aula na Sexta-Feira", 
        data: DateTime(2026, 02, 26), 
        horario: "08:00"
      ),
      NotificationModel(
        nome: "Vivianne Alves", 
        descricao: "Piscina em Tratamento na Segunda-Feira", 
        data: DateTime(2026, 02, 26), 
        horario: "11:00"
      ),
      NotificationModel(
        nome: "Vivianne Alves", 
        descricao: "Quarta será feriado na Apanat", 
        data: DateTime(2026, 02, 26), 
        horario: "14:32"
      ),
    ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: "Apanat"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Notificações",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: 2,),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
              child: Text(
                "Confira as últimas notificações do clube",
                style: TextStyle(
                  color: const Color.fromARGB(255, 138, 138, 138),
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            ...notificacoes.map((notificacoes) => NotificationCard(notification: notificacoes))
          ],
        ),
      ),
      bottomNavigationBar: ButtonNavBar(
        indiceAtual: _indiceSelecionado, 
        onTap: (indice) {
          setState(() => _indiceSelecionado = indice);
          switch (indice) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/historico');
              break;
            case 2:
              Navigator.pushNamed(context, "/notificacoes");
              break;
            case 3:
              Navigator.pushNamed(context, "/perfil");
              break;
          }
      },),
    );
  }
    
  }