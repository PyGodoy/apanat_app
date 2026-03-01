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

  final List<HistoricoModel> historicos = [
    HistoricoModel(
      titulo: "Treinamento Equipe",
      nomeProfessor: "Vivianne Alves",
      data: DateTime(2026, 02, 21),
      horario: "08:00",
    ),
    HistoricoModel(
      titulo: "Treinamento Equipe",
      nomeProfessor: "Vivianne Alves",
      data: DateTime(2026, 02, 22),
      horario: "08:00",
    ),
    HistoricoModel(
      titulo: "Treinamento Equipe",
      nomeProfessor: "Antonio Cuba",
      data: DateTime(2026, 02, 23),
      horario: "08:00",
    ),
    HistoricoModel(
      titulo: "Treinamento Equipe",
      nomeProfessor: "Antonio Cuba",
      data: DateTime(2026, 02, 24),
      horario: "08:00",
    ),
    HistoricoModel(
      titulo: "Treinamento Equipe",
      nomeProfessor: "Antonio Cuba",
      data: DateTime(2026, 02, 25),
      horario: "08:00",
    ),
    HistoricoModel(
      titulo: "Treinamento Equipe",
      nomeProfessor: "Antonio Cuba",
      data: DateTime(2026, 02, 26),
      horario: "08:00",
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
            ...historicos.map((historicos) => HistoricoCard(historico: historicos)).toList()
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