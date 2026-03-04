import 'package:apanat_app/modules/notificacoes/notificacoes_view_model.dart';
import 'package:apanat_app/shared/models/notification_model.dart';
import 'package:apanat_app/shared/widgets/app_bar.dart';
import 'package:apanat_app/shared/widgets/app_button_nav_bar.dart';
import 'package:apanat_app/shared/widgets/notification_card.dart';
import 'package:flutter/material.dart';

class NotificacoesView extends StatefulWidget{
  const NotificacoesView({super.key});
  
  @override
  State<NotificacoesView> createState() => _NotificacoesView();

}

  class _NotificacoesView extends State<NotificacoesView> {
    final NotificacoesViewModel _viewModel = NotificacoesViewModel();
    @override
    void initState() {
      super.initState();
      setState(() {
        _viewModel.addListener(() => setState(() {
          
        }));
        _viewModel.carregarNotificacoes();
      });
    }

    @override
    void dispose() {
      super.dispose;
      
    }
    
    int _indiceSelecionado = 2;
  
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
            ..._viewModel.notificacoes.map((item) => NotificationCard(
              notification: NotificationModel(
                nome: item['nome_professor'], 
                descricao: item['descricao'], 
                data: DateTime.parse(item['data']),
                horario: item['horario'])
            ))
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