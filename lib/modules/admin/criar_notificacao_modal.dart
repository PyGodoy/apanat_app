import 'package:apanat_app/services/auth.service.dart';
import 'package:apanat_app/services/notificacoes.service.dart';
import 'package:apanat_app/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class CriarNotificacaoModal extends StatefulWidget {
  @override
  State<CriarNotificacaoModal> createState() => _CriarNotificacaoModal(); 
   
}

class _CriarNotificacaoModal extends State<CriarNotificacaoModal> {
  DateTime? _dataSelecionada;
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

  void _selecionarData() async {
    final DateTime? data = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (data != null) {
        setState(() {
            _dataSelecionada = data;
        });
    }
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
                          final data = _dataSelecionada!.toIso8601String().split('T')[0];
                          
                          await NotificacoesService().createNotificacao(
                              _professorSelecionado!,
                              tituloController.text,
                              data,
                              horario,
                          );
                          
                          Navigator.pop(context);
                      },
                      child: Text('Salvar', style: TextStyle(color: Color(0xFF208286)),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: GestureDetector(
                  onTap: _selecionarData,
                  child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                          _dataSelecionada != null
                              ? '${_dataSelecionada!.day.toString().padLeft(2,'0')}/${_dataSelecionada!.month.toString().padLeft(2,'0')}/${_dataSelecionada!.year}'
                              : 'Selecione a data',
                          style: TextStyle(color: Colors.white),
                      ),
                  ),
              ),
            ),
            AppTextField(
              label: "Titulo", 
              hintlabel: "Informe o titulo da notificação",
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
          ],
        ),
      ),
    ); 
  }
}