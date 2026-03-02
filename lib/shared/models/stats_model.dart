import 'package:flutter/material.dart';

class StatsModel {
  final String titulo;
  final int total;
  final String duracao;
  final Color color;
  final IconData icon;
  final String sufixo;

  StatsModel({
    required this.titulo,
    required this.total,
    required this.duracao,
    required this.color,
    required this.icon,
    this.sufixo = '',
  });
}