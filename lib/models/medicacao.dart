import 'package:flutter/material.dart';

class Medicacao {
  final String nome;
  final String dose;
  final TimeOfDay horario;
  bool tomada;

  Medicacao({
    required this.nome,
    required this.dose,
    required this.horario,
    this.tomada = false,
  });

  String get horaFormatada {
    final hour = horario.hour.toString().padLeft(2, '0');
    final minute = horario.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}