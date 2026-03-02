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
  @override
  Widget build(BuildContext context) {
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
              Diaaulaswidget(
                diaSemana: "Segunda-Feira", 
                aulas: [
                  AulaModel(
                    horario: "08:00", 
                    nomeProfessor: "Vivianne Alves", 
                    titulo: "Treinamento Equipe", 
                    vagas: 12,
                  ),
                  AulaModel(
                    horario: "09:00", 
                    nomeProfessor: "Luiz Soares", 
                    titulo: "Treinamento Intermediário", 
                    vagas: 12,
                  ),
                  AulaModel(
                    horario: "08:00", 
                    nomeProfessor: "Kauanny", 
                    titulo: "Treinamento Infantil", 
                    vagas: 12,
                  ),
                ]
              ),
              Diaaulaswidget(
                diaSemana: "Terça-Feira", 
                aulas: [
                  AulaModel(
                    horario: "08:00", 
                    nomeProfessor: "Vivianne Alves", 
                    titulo: "Treinamento Intermediario", 
                    vagas: 12
                  ),
                  AulaModel(
                    horario: "14:00", 
                    nomeProfessor: "Antonio Cuba", 
                    titulo: "Treinamento Equipe", 
                    vagas: 12
                  ),
                  AulaModel(
                    horario: "18:00", 
                    nomeProfessor: "Kauanny", 
                    titulo: "Treinamento Infantil", 
                    vagas: 12
                  )
                ]
              ),
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