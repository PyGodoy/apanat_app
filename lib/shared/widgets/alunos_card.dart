import 'package:apanat_app/shared/models/alunos_model.dart';
import 'package:flutter/material.dart';

class AlunosCard extends StatelessWidget {
  final AlunosModel alunos;

  const AlunosCard ({
    super.key,
    required this.alunos,
  });

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            alunos.nome,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w800
            ),
          ),
          SizedBox(height: 5,),
          Text(
            alunos.contato,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w800
            ),
          ),
          SizedBox(height: 5,),
          Text(
            '${alunos.criadoem.day.toString().padLeft(2, '0')}/${alunos.criadoem.month.toString().padLeft(2, '0')}/${alunos.criadoem.year}',
            style: TextStyle(
            color: const Color.fromARGB(255, 34, 34, 34),
            fontSize: 14,
            fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

}