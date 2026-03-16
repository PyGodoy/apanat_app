
import 'package:apanat_app/modules/admin/criaraula/criar_notificacao_modal.dart';
import 'package:apanat_app/modules/notificacoes/notificacoes_view_model.dart';
import 'package:apanat_app/services/auth.service.dart';
import 'package:apanat_app/shared/models/notification_model.dart';
import 'package:apanat_app/shared/widgets/app_bar.dart';
import 'package:apanat_app/shared/widgets/app_button.dart';
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
    
    String? _role;
    void carregarRole() async {
      final role = await AuthService().getRole();
      setState(() {
        _role = role;
      });
    }

    @override
    void initState() {
      super.initState();
      carregarRole();
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
            SizedBox(height: 12,),
            if (_role == 'admin') ... [
              Container(
                width: double.infinity,
                padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
                child: AppButton(
                  text: "Criar Notificação",
                  onPressed: () async { 
                    await showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        backgroundColor: Color.fromARGB(255, 34, 34, 34),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                        child: CriarNotificacaoModal(),
                      ),
                    );
                    _viewModel.carregarNotificacoes();
                  },
                ),
              )
            ],
            SizedBox(height: 12,),
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