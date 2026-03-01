import 'package:apanat_app/shared/models/aula_model.dart';
import 'package:apanat_app/shared/widgets/aula_card.dart';
import 'package:flutter/material.dart';

class Diaaulaswidget extends StatelessWidget {

  final String diaSemana;
  final List<AulaModel> aulas;

  const Diaaulaswidget({
    super.key,
    required this.diaSemana,
    required this.aulas,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 14,top: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.calendar_month_outlined, 
                color: Color(0xFF208286),
              ),
              SizedBox(width: 5,),
              Text(
                diaSemana,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children:aulas.map((aula) => AulaCard(aula: aula)).toList(),
        )
      ],
    );
    
  }

}