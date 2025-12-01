import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/viewMedicacao.dart';
import 'package:flutter_application_1/theme/appTheme.dart';
import 'package:flutter_application_1/utils/app_routes.dart';
import 'package:intl/intl.dart';

// Modelo de Evento da Agenda
class AgendaEvent {
  final String title;
  final DateTime date;
  final String description;
  final IconData icon;
  final Color color;

  AgendaEvent({
    required this.title,
    required this.date,
    required this.description,
    required this.icon,
    required this.color,
  });
}

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({super.key});

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  // Lista de eventos de exemplo
  final List<AgendaEvent> _events = [
    AgendaEvent(
      title: "Consulta Cardiologista",
      date: DateTime.now().add(const Duration(days: 2, hours: 10)),
      description: "Dr. Silva - Hospital Central. Levar exames recentes.",
      icon: Icons.favorite,
      color: AppTheme.primaryColor,
    ),
    AgendaEvent(
      title: "Exame de Sangue",
      date: DateTime.now().add(const Duration(days: 5, hours: 8)),
      description: "Jejum de 12 horas. Laboratório Santa Clara.",
      icon: Icons.science,
      color: AppTheme.secondaryColor,
    ),
    AgendaEvent(
      title: "Fisioterapia",
      date: DateTime.now().add(const Duration(days: 10, hours: 15)),
      description: "Sessão 5/10. Clínica Reabilita.",
      icon: Icons.accessibility_new,
      color: Colors.orange,
    ),
  ];

  void _removeEvent(AgendaEvent event) {
    setState(() {
      _events.remove(event);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Evento "${event.title}" removido com sucesso!'),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _navigateToAddEvent() async {
    final newEvent = await Navigator.of(context).pushNamed(AppRoutes.ADD_EVENT);

    if (newEvent != null && newEvent is AgendaEvent) {
      setState(() {
        _events.add(newEvent);
        _events.sort((a, b) => a.date.compareTo(b.date)); 
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Evento adicionado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda de Saúde'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined),
            onPressed: _navigateToAddEvent,
            tooltip: 'Adicionar Evento',
          ),
        ],
      ),
      body: _events.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.calendar_today, size: 60, color: Colors.grey),
                  SizedBox(height: 10),
                  Text('Nenhum evento agendado.', style: TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _events.length,
              itemBuilder: (context, index) {
                final event = _events[index];
                return AgendaCard(
                  event: event,
                  onRemove: _removeEvent,
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToAddEvent,
        label: const Text('Novo Evento'),
        icon: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 240, 242, 243),
        foregroundColor: AppTheme.primaryColor,
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 2),
    );
  }
}
class AgendaCard extends StatelessWidget {
  final AgendaEvent event;
  final Function(AgendaEvent) onRemove;

  const AgendaCard({super.key, required this.event, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    final DateFormat timeFormat = DateFormat('HH:mm');

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: event.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(event.icon, color: event.color, size: 30),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryColor,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    event.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        dateFormat.format(event.date),
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.access_time, size: 14, color: Colors.grey                      ),
                      const SizedBox(width: 4),
                      Text(
                        timeFormat.format(event.date),
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete_forever, color: Colors.red),
              onPressed: () => onRemove(event),
              tooltip: 'Remover Evento',
            ),
          ],
        ),
      ),
    );
  }
}
