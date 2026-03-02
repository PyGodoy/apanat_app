import 'dart:ffi';

import 'package:apanat_app/shared/models/profile_model.dart';
import 'package:apanat_app/shared/widgets/app_button.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget{
  final ProfileModel profile;
  const ProfileCard({super.key, required this.profile});


  @override
  State<ProfileCard> createState() => _ProfileCard(); 
}

  class _ProfileCard extends State<ProfileCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 1)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50, 
            backgroundImage: NetworkImage(widget.profile.imagemUrl),
          ),
          SizedBox(height: 20,),
          Text(
            widget.profile.nome,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600
            ),
          ),
          Text(
            widget.profile.aluDesde,
            style: TextStyle(
              color: const Color.fromARGB(255, 34, 34, 34),
              fontSize: 14,
            ),
          ),
          SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email_outlined, color: Color(0xFF208286), size: 20,),
              SizedBox(width: 5,),
              Text(
                widget.profile.email,
                style: TextStyle(
                  color: const Color.fromARGB(255, 34, 34, 34),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.call, color: Color(0xFF208286), size: 20),
              SizedBox(width: 5,),
              Text(
                widget.profile.telefone,
                style: TextStyle(
                color: const Color.fromARGB(255, 34, 34, 34),
                fontSize: 14,
                ),
              ),
            ]
          ),
          SizedBox(height: 15,),
          Padding(
            padding: EdgeInsetsGeometry.all(12),
            child: AppButton(
                text: "Editar Perfil", 
                onPressed:() {
                  setState(() {
                    
                  });
                },),
          ),
        ],
      ),
    );
  }
}
  