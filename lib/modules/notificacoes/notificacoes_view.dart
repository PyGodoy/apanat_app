import 'package:apanat_app/shared/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class NotificacoesView extends StatefulWidget{
  
  @override
  State<NotificacoesView> createState() => _NotificacoesView();
}

  class _NotificacoesView extends State<NotificacoesView> {
    int _indiceSelecionado = 2;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(title: "Apanat"),
      body: SingleChildScrollView(
        
      ),
    );
  }
    
  }