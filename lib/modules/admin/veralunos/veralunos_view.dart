import 'package:apanat_app/modules/admin/veralunos/veralunos_view_model.dart';
import 'package:apanat_app/shared/models/alunos_model.dart';
import 'package:apanat_app/shared/widgets/alunos_card.dart';
import 'package:flutter/material.dart';

class VeralunosView extends StatefulWidget {
  const VeralunosView({super.key});
  
  @override
  State<VeralunosView> createState() => _verAlunosView();
}

class _verAlunosView extends State<VeralunosView> {

  final VeralunosViewModel _viewModel = VeralunosViewModel();

  @override
  void initState() {
    super.initState();
    setState(() {
      _viewModel.addListener(() => setState(() {
        
      }));
      _viewModel.carregarAlunos();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Alunos Cadastrados",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600
                ),
                ),
              SizedBox(height: 5,),
              Text(
                "Visualize os alunos cadastrados",
                style: TextStyle(
                  color: const Color.fromARGB(255, 138, 138, 138),
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(height: 12,),
              ..._viewModel.alunos.map((item) => AlunosCard(
                alunos: AlunosModel(
                  nome: item['usuario'],
                  contato: item['telefone'] ?? 'Sem contato',
                  criadoem: item['criado_em'] != null 
                  ? DateTime.parse(item['criado_em']) 
                  : DateTime.now(),
                ))
              )
            ],
          ),
        ),
      ),
    );
  }

}
