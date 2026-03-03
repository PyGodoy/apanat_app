import 'package:apanat_app/modules/perfil/perfil_view_model.dart';
import 'package:apanat_app/shared/models/profile_model.dart';
import 'package:apanat_app/shared/models/stats_model.dart';
import 'package:apanat_app/shared/widgets/app_bar.dart';
import 'package:apanat_app/shared/widgets/app_button_nav_bar.dart';
import 'package:apanat_app/shared/widgets/profile_card.dart';
import 'package:apanat_app/shared/widgets/stats_card.dart';
import 'package:flutter/material.dart';

class PerfilView extends StatefulWidget{
  const PerfilView({super.key});

  @override
  State<PerfilView> createState() => _PerfilView();
}
  class _PerfilView extends State<PerfilView> {
  final PerfilViewModel _viewModel = PerfilViewModel();
  @override
  void initState(){
    super.initState();
    _viewModel.addListener(() => setState(() {
      
    }));
    _viewModel.perfil();
  }

  int _indiceSelecionado = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBarCustom(title: "Apanat",),
    body: SingleChildScrollView (
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Padding( 
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Meu Perfil",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 2,),
                Text(
                  "Suas Informações e Estatísticas",
                  style: TextStyle(
                    color:  Color.fromARGB(255, 138, 138, 138),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: ProfileCard(
              profile: 
              ProfileModel(
                imagemUrl: "https://img.freepik.com/fotos-gratis/homem-cacheado-com-sorriso-largo-mostra-dentes-perfeitos-se-diverte-com-uma-conversa-interessante-tem-cabelos-escuros-e-crespos-e-crespos-contra-uma-parede-branca_273609-17092.jpg?semt=ais_hybrid&w=740&q=80", 
                nome: _viewModel.usuario ?? "Carregando...",
                email: _viewModel.email ?? "Carregando...",
                aluDesde: "Aluno desde 15 de Setembro de 2024", 
                telefone: _viewModel.telefone ??"Sem telefone"
              ),
              onEditarPerfil: () async {
                await Navigator.pushNamed(context, "/editarperfil");
                await _viewModel.perfil(); // atualiza ao voltar
              },
            ),
          ),
          StatsCard(status: StatsModel(
            icon: Icons.check_circle_outline,
            titulo: "Check-ins",
            total: _viewModel.checkInsMes, // ← dado real
            duracao: "Este mês",
            color: Color(0xFF208286)
          )),
          StatsCard(status: StatsModel(
              icon: Icons.water,
              titulo: "Aulas",
              total: 156,
              duracao: "Totais realizadas",
              color: Color.fromARGB(255, 44, 134, 32)
          )),
          StatsCard(status: StatsModel(
              icon: Icons.workspace_premium_outlined,
              titulo: "Frequência",
              total: 42,
              sufixo: "%",
              duracao: "Nos últimos 30 dias",
              color: Color.fromARGB(255, 102, 32, 134)
          )),
        ],
      ),
    ),
    bottomNavigationBar: ButtonNavBar(
      indiceAtual: _indiceSelecionado, 
      onTap:(indice) {
        setState(() => _indiceSelecionado = indice);
        switch(indice) {
          case 0:
            Navigator.pushNamed(context,"/home");
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