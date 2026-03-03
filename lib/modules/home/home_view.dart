import 'package:apanat_app/services/auth.service.dart';
import 'package:apanat_app/shared/models/aula_model.dart';
import 'package:apanat_app/shared/widgets/DiaAulasWidget.dart';
import 'package:apanat_app/shared/widgets/app_bar.dart';
import 'package:apanat_app/shared/widgets/app_button_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView ({super.key});
  
  @override
  State<HomeView> createState() => _HomeView();
  
}

class _HomeView extends State<HomeView> {
  int _indiceSelecionado = 0; 

  Map<String, List<AulaModel>> agruparPorDia(List<AulaModel> aulas) {
    Map<String, List<AulaModel>> agrupadas = {};

    for (var aula in aulas) {
      if (!agrupadas.containsKey(aula.diaSemana)) {
        agrupadas[aula.diaSemana] = [];
      }
      agrupadas[aula.diaSemana]!.add(aula);
    }

    return agrupadas;
  }

  List<AulaModel> aulas = [];

  @override
  void initState() {
    super.initState();
    carregarAulas();
  }
  void carregarAulas() async {
    final dados = await AuthService().getAulas();
    setState(() {
      aulas = dados.map<AulaModel>((a) => AulaModel.fromJson(a)).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    final aulasAgrupadas = agruparPorDia(aulas);
    return(
      Scaffold(
        appBar: AppBarCustom(title: "Apanat"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Grade de Aulas",
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
                  "Confira toda a programação semanal",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 138, 138, 138),
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),
                  ),
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: aulasAgrupadas.entries.map((entry) {
                  return Diaaulaswidget(
                    diaSemana: entry.key,
                    aulas: entry.value,
                  );
                }).toList(),
              )
            ],
          ),
        ),
        bottomNavigationBar: ButtonNavBar(
          indiceAtual: _indiceSelecionado, 
          onTap: (indice) {
            setState(() => _indiceSelecionado = indice);
            switch(indice) {
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
          }
        )
      )
    );
  }
}