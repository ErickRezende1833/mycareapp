import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/appTheme.dart';
import 'package:intl/intl.dart';
import 'dados_vitais_screen.dart';
import 'package:flutter_application_1/view/viewMedicacao.dart';

class RegistrarDadosVitaisScreen extends StatefulWidget {
  const RegistrarDadosVitaisScreen({super.key});

  @override
  State<RegistrarDadosVitaisScreen> createState() => _RegistrarDadosVitaisScreenState();
}

class _RegistrarDadosVitaisScreenState extends State<RegistrarDadosVitaisScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _valorController = TextEditingController();
  String _tipoSelecionado = "Pressão Arterial";
  DateTime _selectedDate = DateTime.now();

  final Map<String, Map<String, dynamic>> _tipos = {
    "Pressão Arterial": {"icon": Icons.bloodtype, "cor": Colors.red},
    "Batimentos": {"icon": Icons.favorite, "cor": Colors.blue},
    "Glicose": {"icon": Icons.analytics, "cor": Colors.orange},
    "Temperatura": {"icon": Icons.thermostat, "cor": Colors.green},
  };

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final tipoInfo = _tipos[_tipoSelecionado]!;

      final dado = VitalData(
        tipo: _tipoSelecionado,
        valor: _valorController.text,
        data: _selectedDate,
        icon: tipoInfo['icon'],
        cor: tipoInfo['cor'],
      );

      Navigator.pop(context, dado); 
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Dado Vital"),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.primaryColor), 
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: _tipoSelecionado,
                items: _tipos.keys
                    .map((tipo) => DropdownMenuItem(
                          value: tipo,
                          child: Text(tipo),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _tipoSelecionado = value!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Tipo de Dado Vital",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: _valorController,
                decoration: InputDecoration(
                  labelText: "Valor",
                  prefixIcon: Icon(_tipos[_tipoSelecionado]!['icon'], color: Colors.grey),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Informe o valor";
                  return null;
                },
              ),
              const SizedBox(height: 18),
              ListTile(
                title: Text("Data: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}"),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.save, color: Colors.white),
                label: const Text("Salvar", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 0),
    );
  }
}
