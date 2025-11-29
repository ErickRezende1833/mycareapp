import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/appTheme.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/view/viewMedicacao.dart';

class Lembrete {
  final String titulo;
  final String descricao;
  final DateTime dataHora;
  final IconData icon;
  final Color cor;

  Lembrete({
    required this.titulo,
    required this.descricao,
    required this.dataHora,
    required this.icon,
    required this.cor,
  });
}

class LembretesScreen extends StatefulWidget {
  const LembretesScreen({super.key});

  @override
  State<LembretesScreen> createState() => _LembretesScreenState();
}

class _LembretesScreenState extends State<LembretesScreen> {
  final List<Lembrete> _lembretes = [];

  void _remover(Lembrete lembrete) {
    setState(() => _lembretes.remove(lembrete));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${lembrete.titulo} removido."),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> _irParaRegistrar() async {
    final novoLembrete = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RegistrarLembreteScreen()),
    );

    if (novoLembrete != null && mounted) {
      setState(() {
        _lembretes.add(novoLembrete as Lembrete);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("dd/MM/yyyy - HH:mm");

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lembretes",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppTheme.primaryColor,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: _lembretes.isEmpty
          ? const Center(
              child: Text(
                "Nenhum lembrete registrado.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _lembretes.length,
              itemBuilder: (context, i) {
                final lembrete = _lembretes[i];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: lembrete.cor.withOpacity(.15),
                      child: Icon(lembrete.icon, color: lembrete.cor),
                    ),
                    title: Text(
                      lembrete.titulo,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: lembrete.cor,
                      ),
                    ),
                    subtitle: Text(
                      "${lembrete.descricao}\n${format.format(lembrete.dataHora)}",
                    ),
                    trailing: IconButton(
                      icon:
                          const Icon(Icons.delete_forever, color: Colors.red),
                      onPressed: () => _remover(lembrete),
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
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 1),
    );
  }
}

/// TELA DE REGISTRAR LEMBRETE
class RegistrarLembreteScreen extends StatefulWidget {
  const RegistrarLembreteScreen({super.key});

  @override
  State<RegistrarLembreteScreen> createState() =>
      _RegistrarLembreteScreenState();
}

class _RegistrarLembreteScreenState extends State<RegistrarLembreteScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _selectedTime);
    if (picked != null) setState(() => _selectedTime = picked);
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final DateTime dataHora = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _selectedTime.hour,
        _selectedTime.minute,
      );

      final novoLembrete = Lembrete(
        titulo: _tituloController.text,
        descricao: _descricaoController.text,
        dataHora: dataHora,
        icon: Icons.alarm,
        cor: AppTheme.primaryColor,
      );

      Navigator.pop(context, novoLembrete);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registrar Lembrete",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppTheme.primaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _tituloController,
                decoration: const InputDecoration(
                  labelText: "Título",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? "Informe o título" : null,
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(
                  labelText: "Descrição (opcional)",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 18),
              ListTile(
                title:
                    Text("Data: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}"),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDate(context),
              ),
              ListTile(
                title: Text("Hora: ${_selectedTime.format(context)}"),
                trailing: const Icon(Icons.access_time),
                onTap: () => _selectTime(context),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.save, color: Colors.white),
                label: const Text("Salvar",
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 1),
    );
  }
}
