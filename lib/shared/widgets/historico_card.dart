import 'package:apanat_app/shared/models/historico_model.dart';
import 'package:flutter/material.dart';

class HistoricoCard extends StatefulWidget{
  final HistoricoModel historico;

  const HistoricoCard({
    super.key,
    required this.historico
  });

  @override
  State<HistoricoCard> createState() => _HistoricoCardState();
}

class _HistoricoCardState extends State<HistoricoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 2)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child:
              Icon(Icons.verified_outlined, color: Color(0xFF208286),)
          ),
          SizedBox(width: 12,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.historico.titulo,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 5,),
              Text(
                widget.historico.nomeProfessor,
                style: TextStyle(
                  color: const Color.fromARGB(255, 34, 34, 34),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.date_range_outlined, color: Colors.grey.shade700, size: 20,),
                  SizedBox(width: 5,),
                  Text(
                    '${widget.historico.data.day.toString().padLeft(2, '0')}/${widget.historico.data.month.toString().padLeft(2,'0')}/${widget.historico.data.year}',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 34, 34, 34),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 12,),
                  Icon(Icons.watch_later_outlined, color: Colors.grey.shade700, size: 20,),
                  SizedBox(width: 5,),
                  Text(
                    widget.historico.horario,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 34, 34, 34),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}