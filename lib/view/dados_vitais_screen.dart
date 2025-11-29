import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/appTheme.dart';
import 'package:intl/intl.dart';
import 'registrar_dados_vitais_screen.dart';
import 'package:flutter_application_1/view/viewMedicacao.dart';

class VitalData {
  final String tipo;
  final String valor;
  final DateTime data;
  final IconData icon;
  final Color cor;

  VitalData({
    required this.tipo,
    required this.valor,
    required this.data,
    required this.icon,
    required this.cor,
  });
}

class DadosVitaisScreen extends StatefulWidget {
  const DadosVitaisScreen({super.key});

  @override
  State<DadosVitaisScreen> createState() => _DadosVitaisScreenState();
}

class _DadosVitaisScreenState extends State<DadosVitaisScreen> {
  final List<VitalData> _dados = [
    VitalData(
      tipo: "Pressão Arterial",
      valor: "12/8 mmHg",
      data: DateTime.now().subtract(const Duration(hours: 5)),
      icon: Icons.favorite,
      cor: Colors.red,
    ),
    VitalData(
      tipo: "Batimentos",
      valor: "78 bpm",
      data: DateTime.now().subtract(const Duration(days: 1)),
      icon: Icons.monitor_heart,
      cor: Colors.blue,
    ),
    VitalData(
      tipo: "Glicemia",
      valor: "92 mg/dL",
      data: DateTime.now().subtract(const Duration(days: 2)),
      icon: Icons.bloodtype,
      cor: Colors.orange,
    ),
  ];

  void _remover(VitalData dado) {
    setState(() => _dados.remove(dado));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${dado.tipo} removido."),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> _irParaRegistrar() async {
    final novoDado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const RegistrarDadosVitaisScreen(),
      ),
    );

    if (novoDado != null && mounted) {
      setState(() {
        _dados.add(novoDado as VitalData);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("dd/MM/yyyy - HH:mm");

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dados Vitais",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppTheme.primaryColor,
        centerTitle: true,
      ),
      body: _dados.isEmpty
          ? const Center(
              child: Text(
                "Nenhum dado registrado.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _dados.length,
              itemBuilder: (context, i) {
                final dado = _dados[i];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: dado.cor.withOpacity(.15),
                      child: Icon(dado.icon, color: dado.cor),
                    ),
                    title: Text(
                      dado.tipo,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: dado.cor,
                      ),
                    ),
                    subtitle:
                        Text("${dado.valor}\n${format.format(dado.data)}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_forever, color: Colors.red),
                      onPressed: () => _remover(dado),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _irParaRegistrar,
        label: const Text("Registrar"),
        icon: const Icon(Icons.add),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 2),
    );
  }
}
