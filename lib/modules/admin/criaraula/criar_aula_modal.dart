import 'package:apanat_app/services/auth.service.dart';
import 'package:apanat_app/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class CriarAulaModal extends StatefulWidget {
  @override
  State<CriarAulaModal> createState() => _CriarAulaModal(); 
   
}

class _CriarAulaModal extends State<CriarAulaModal> {
  String? _diaSelecionado;
  TimeOfDay? _horarioSelecionado;
  List<dynamic> _professores = [];
  String? _professorSelecionado;
  final tituloController = TextEditingController(); // ← adiciona
  final vagasController = TextEditingController();
  final List<String> diasSemana = [
      'Segunda-Feira',
      'Terça-Feira',
      'Quarta-Feira',
      'Quinta-Feira',
      'Sexta-Feira',
      'Sábado',
  ];

  @override
  void initState() {
      super.initState();
      _carregarProfessores();
  }

  void _carregarProfessores() async {
      final dados = await AuthService().getProfessores();
      print('PROFESSORES: $dados'); 
      setState(() {
          _professores = dados;
      });
  }

  void _selecionarHorario() async {
    final TimeOfDay? horario = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
    );
    if (horario != null) {
        setState(() {
            _horarioSelecionado = horario;
        });
    }
  }

  @override
  void dispose() {
      tituloController.dispose();
      vagasController.dispose();
      super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 34, 34, 34),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Text("Horario", style: TextStyle(color: Colors.white, fontSize: 18),),
                  SizedBox(width: 12,),
                  GestureDetector(
                    onTap: _selecionarHorario,
                    child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                            _horarioSelecionado != null 
                                ? _horarioSelecionado!.format(context)
                                : 'Selecione o horário',
                            style: TextStyle(color: Colors.white),
                        ),
                    ),
                  ),
                  SizedBox(width: 30,),
                  ElevatedButton(
                    onPressed: () async {
                        final horario = _horarioSelecionado!.format(context);
                        
                        await AuthService().criarAula(
                            _diaSelecionado!,
                            horario,
                            tituloController.text,
                            _professorSelecionado!,
                            int.parse(vagasController.text),
                        );
                        
                        Navigator.pop(context);
                    },
                    child: Text('Salvar', style: TextStyle(color: Color(0xFF208286)),),
                )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: DropdownButtonFormField<String>(
                value: _diaSelecionado,
                dropdownColor: Color.fromARGB(255, 34, 34, 34),
                hint: Text("Selecione o dia", style: TextStyle(color: Colors.white)),
                items: diasSemana.map((dia) => DropdownMenuItem(
                  value: dia,
                  child: Text(dia, style: TextStyle(color: Colors.white),),
                )).toList(),
                onChanged:(valor) {
                  setState(() {
                    _diaSelecionado = valor;
                  });
                },
                ),
            ),
            AppTextField(
              label: "Titulo", 
              hintlabel: "Informe o titulo da aula",
              controller: tituloController,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Professor", style: TextStyle(color: Colors.white, fontSize: 18),),
                  DropdownButtonFormField<String>(
                    dropdownColor: Color.fromARGB(255, 34, 34, 34),
                    value: _professorSelecionado,
                    hint: Text('Selecione o professor', style: TextStyle(color: Colors.white)),
                    items: _professores.map((prof) => DropdownMenuItem<String>(
                        value: prof['usuario'], // ← nome do professor
                        child: Text(prof['usuario'], style: TextStyle(color: Colors.white)),
                    )).toList(),
                    onChanged: (valor) {
                        setState(() {
                            _professorSelecionado = valor;
                        });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),
            AppTextField(
              label: "Vagas", 
              hintlabel: "Quantidade de vagas",
              controller: vagasController,
            ),
            SizedBox(height: 24,)
          ],
        ),
      ),
    ); 
  }
}