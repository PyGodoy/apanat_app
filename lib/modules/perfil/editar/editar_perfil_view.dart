import 'package:apanat_app/modules/perfil/editar/editar_perfil_view_model.dart';
import 'package:apanat_app/modules/perfil/perfil_view.dart';
import 'package:apanat_app/shared/widgets/app_bar.dart';
import 'package:apanat_app/shared/widgets/app_button.dart';
import 'package:apanat_app/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class EditarPerfilView extends StatefulWidget{

  @override
  State<EditarPerfilView> createState() => _EditarPerfilView();

}

  class _EditarPerfilView extends State<EditarPerfilView> {
    final EditarPerfilViewModel _viewmodel = EditarPerfilViewModel();
    late TextEditingController usuarioController;
    late TextEditingController emailController;
    late TextEditingController telefoneController;

    @override
    void initState(){
      super.initState();
      usuarioController = TextEditingController();
      emailController = TextEditingController();
      telefoneController = TextEditingController();

      _viewmodel.carregarPerfil().then((_) {
        usuarioController.text = _viewmodel.usuario ?? "";
        emailController.text = _viewmodel.email ?? "";
        telefoneController.text = _viewmodel.telefone ?? "";
      });
    }

    @override
    void dispose() {
      usuarioController.dispose();
      emailController.dispose();
      telefoneController.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: "Apanat"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              AppTextField(
                label: "Nome", 
                hintlabel: "Seu nome",
                controller: usuarioController,
              ),
              SizedBox(height: 24,),
              AppTextField(
                label: "Email", 
                hintlabel: "Seu Email",
                controller: emailController,
              ),
              SizedBox(height: 24,),
              AppTextField(
                label: "Telefone", 
                hintlabel: "Seu Telefone",
                controller: telefoneController,
              ),
              SizedBox(height: 24,),
              AppButton(
                text: "Salvar Perfil", 
                onPressed: () async {
                  try {
                    await _viewmodel.salvarPerfil(
                      usuarioController.text, 
                      emailController.text, 
                      telefoneController.text
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Perfil atualizado com sucesso")),
                    );

                    Navigator.pop(context, true);

                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Erro ao salvar perfil")),
                    );
                  }
                }
              )
            ],
          ),
        )
      ),
    );
  }

  }
