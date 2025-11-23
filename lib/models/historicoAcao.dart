import 'package:flutter/material.dart';

class HistoricoAcao {
  final String nomeMedicamento;
  final TimeOfDay horarioPrevisto;
  final bool tomada;
  final DateTime registro; 

  HistoricoAcao({
    required this.nomeMedicamento,
    required this.horarioPrevisto,
    required this.tomada,
    required this.registro,
  });

  String get dataHoraFormatadaRegistro {
    final day = registro.day.toString().padLeft(2, '0');
    final month = registro.month.toString().padLeft(2, '0');
    final hour = registro.hour.toString().padLeft(2, '0');
    final minute = registro.minute.toString().padLeft(2, '0');
    return '$day/$month - $hour:$minute';
  }

  String get horaFormatadaPrevista {
    final hour = horarioPrevisto.hour.toString().padLeft(2, '0');
    final minute = horarioPrevisto.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
  
  String get horaFormatadaRegistro {
    final hour = registro.hour.toString().padLeft(2, '0');
    final minute = registro.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}