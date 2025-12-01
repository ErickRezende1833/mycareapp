import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/appTheme.dart';
import 'package:flutter_application_1/view/viewMedicacao.dart'; 


class AjudaScreen extends StatelessWidget {
  const AjudaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajuda'),
        backgroundColor: AppTheme.primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [

          Text(
            "Perguntas Frequentes",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
          SizedBox(height: 16),

          Text("• Como adiciono um medicamento?\n"
              "  ➤ Vá na tela de medicamentos e clique em adicionar."),

          SizedBox(height: 12),

          Text("• Onde vejo consultas futuras?\n"
              "  ➤ Na aba Agenda você visualiza eventos de saúde."),

          SizedBox(height: 12),

          Text("• Como adiciono um dado vital?\n"
              "  ➤ Acesse Dados Vitais e cadastre o dado desejado."),

          SizedBox(height: 12),

          Text("• Como altero meus dados pessoais?\n"
              "  ➤ Vá em Perfil para editar informações."),
        ],
      ),

      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 1),
    );
  }
}
