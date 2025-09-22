import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/viewAddMedicacao.dart';
import 'package:flutter_application_1/view/viewMedicacao.dart';
import 'package:flutter_application_1/theme/appTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      home: ViewAddMedicacao(),
    );
  }
}
