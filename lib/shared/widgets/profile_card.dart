import 'dart:convert';
import 'dart:io';

import 'package:apanat_app/services/auth.service.dart';
import 'package:apanat_app/shared/models/profile_model.dart';
import 'package:apanat_app/shared/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCard extends StatefulWidget{
  final ProfileModel profile;
  final VoidCallback? onEditarPerfil;
  const ProfileCard({super.key, required this.profile, this.onEditarPerfil,});


  @override
  State<ProfileCard> createState() => _ProfileCard(); 
}

  class _ProfileCard extends State<ProfileCard> {
  String? _fotoLocal;
  final ImagePicker _picker = ImagePicker();

  Future<void> _selecionarFoto() async {
    final XFile? imagem = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 500,
        maxHeight: 500,
        imageQuality: 70,
    );
      
    if (imagem != null) {
      final bytes = await File(imagem.path).readAsBytes();
      final base64 = base64Encode(bytes);
      await AuthService().putPerfil(
          widget.profile.nome,
          widget.profile.email,
          widget.profile.telefone,
          'data:image/jpeg;base64,$base64',
      );
      setState(() {
          _fotoLocal = base64; // ← atualiza na tela
        }
      );
    }
  } 

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
          GestureDetector(
            onTap: _selecionarFoto,
            child: CircleAvatar(
                radius: 50,
                backgroundImage: _fotoLocal != null
                  ? MemoryImage(base64Decode(_fotoLocal!)) // ← foto nova
                  : widget.profile.imagemUrl != null && widget.profile.imagemUrl!.startsWith('data:')
                    ? MemoryImage(base64Decode(widget.profile.imagemUrl!.split(',')[1])) // ← foto do banco
                    : NetworkImage('https://ui-avatars.com/api/?name=${widget.profile.nome}') as ImageProvider, // ← padrão
            ),
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
                onPressed: widget.onEditarPerfil!,
              ),
            ),
          ],
        ),
      );
    }
  }
  