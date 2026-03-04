import 'package:apanat_app/modules/historico/historico_view_model.dart';
import 'package:apanat_app/shared/models/historico_model.dart';
import 'package:apanat_app/shared/widgets/app_bar.dart';
import 'package:apanat_app/shared/widgets/app_button_nav_bar.dart';
import 'package:apanat_app/shared/widgets/historico_card.dart';
import 'package:flutter/material.dart';

class HistoricoView extends StatefulWidget {
  const HistoricoView({super.key});

  @override
  State<HistoricoView> createState() => _HistoricoView();
}
  
  class _HistoricoView extends State<HistoricoView> {
  int _indiceSelecionado = 1;
  final HistoricoViewModel _viewModel = HistoricoViewModel();

  @override
  void initState() {
    super.initState();
    setState(() {
      _viewModel.addListener(() => setState(() {
        
      }));
      _viewModel.carregarHistorico();
    });
  }
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
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Histórico de Check-ins",
                style: TextStyle(
                   color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 2,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Suas últimas aulas realizadas",
                style: TextStyle(
                  color: const Color.fromARGB(255, 138, 138, 138),
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            ..._viewModel.historico.map((item) => HistoricoCard(
              historico: HistoricoModel(
                titulo: item['aula'], 
                nomeProfessor: 'Prof. '+ item['professor'],
                data: DateTime.parse(
                    item['criado_em'].endsWith('Z') 
                        ? item['criado_em'] 
                        : item['criado_em'] + 'Z'
                ).toLocal(),
                horario: item['horario'] ??'',
                )
              ))
          ],
        ),
      ),
      bottomNavigationBar: ButtonNavBar(
        indiceAtual: _indiceSelecionado , 
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
        },
      ),
    );
  }

}