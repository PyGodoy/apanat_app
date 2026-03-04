import 'package:apanat_app/services/auth.service.dart';
import 'package:apanat_app/shared/models/aula_model.dart';
import 'package:flutter/material.dart';

class AulaCard extends StatefulWidget {
  final AulaModel aula;
  
  const AulaCard({
    super.key,
    required this.aula
  });

  @override
  State<AulaCard> createState() => _AulaCard();
}

  class _AulaCard extends State<AulaCard> {
    bool checkInRealizado = false;
    int? checkInId;
    
    void _verificarCheckin() async {
      final resultado = await AuthService().verificarCheckin(widget.aula.id);
      print('RESULTADO VERIFICAR: $resultado');
      setState(() {
        checkInRealizado = resultado['jaFez'];
        checkInId = resultado['checkInId'];
      });
    }

    void _deletarCheckin() async {
      final deletar = await AuthService().deletarCheckin(widget.aula.id);
      setState(() {
        checkInRealizado = deletar['checkinDeletado'];
      });
    }
    
    @override
    void initState(){
      super.initState();
      _verificarCheckin();
      
    }
    @override
    Widget build(BuildContext context) {
      return Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 2)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.watch_later_outlined, color: Color(0xFF208286),),
                SizedBox(width: 5,),
                Text(
                  widget.aula.horario, 
                  style: TextStyle(
                    color: Color(0xFF208286), 
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12,),
             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.aula.titulo,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 12,),
                Text(
                  "Prof. "+widget.aula.nomeProfessor,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 34, 34, 34),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12,),
                Row(
                  children: [
                    Icon(Icons.group, color: Colors.grey.shade700,),
                    SizedBox(width: 5,),
                    Text(
                      "${widget.aula.vagas} vagas",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 34, 34, 34),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 12,),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 4,
                      backgroundColor: checkInRealizado ? Colors.red : Color(0xFF208286),
                    ),
                    onPressed: () async {
                      if (checkInRealizado) {
                        final resultado = await AuthService().deletarCheckin(checkInId!);

                        if (resultado['checkinDeletado'] == true) {
                          setState(() {
                            checkInRealizado = false;
                            checkInId = null;
                          });
                        }
                      } else {
                        final resultado =
                            await AuthService().realizarCheckin(widget.aula.id, widget.aula.nomeProfessor);

                        setState(() {
                          checkInRealizado = true;
                          checkInId = resultado['id'];
                        });
                      }
                    },
                    child: Text(
                      checkInRealizado ? "Cancelar Check-in" : "Realizar Check-in",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }
  }