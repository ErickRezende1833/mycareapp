import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/medicacao.dart'; // Usando medicacao.dart
import 'package:flutter_application_1/view/viewAddMedicacao.dart';
import 'package:flutter_application_1/models/historicoAcao.dart';

class ViewMedicacao extends StatefulWidget {
  const ViewMedicacao({super.key});

  @override
  State<ViewMedicacao> createState() => _ViewMedicacaoState();
}

class _ViewMedicacaoState extends State<ViewMedicacao> {
  final List<Medicacao> _minhasMedicacoes = [
    Medicacao(
      nome: "Diazepan",
      dose: "1g",
      horario: const TimeOfDay(hour: 8, minute: 0),
    ),
    Medicacao(
      nome: "Diazepan",
      dose: "1g",
      horario: const TimeOfDay(hour: 16, minute: 0),
    ),
  ];

  final List<HistoricoAcao> _historicoAcoes = [];

  void _navigateToAddMedicacao() async {
    final novaMedicacao = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ViewAddMedicacao()),
    );

    if (novaMedicacao != null && novaMedicacao is Medicacao) {
      setState(() {
        _minhasMedicacoes.add(novaMedicacao);
      });
    }
  }

  void _registrarAcao(Medicacao medicacao, bool tomada) {
    setState(() {
      final novaAcao = HistoricoAcao(
        nomeMedicamento: medicacao.nome,
        horarioPrevisto: medicacao.horario, 
        tomada: tomada,
        registro: DateTime.now(),
      );
      
      _historicoAcoes.insert(0, novaAcao);
    });
  }

  void _removerMedicacao(Medicacao medicacao) {
    setState(() {
      _minhasMedicacoes.remove(medicacao);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/logotipo.png', height: 40),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Meus Medicamentos",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _minhasMedicacoes.length,
                itemBuilder: (context, index) {
                  final med = _minhasMedicacoes[index];
                  return MedicamentoCard(
                    medicacao: med,
                    onAction: _registrarAcao,   
                    onRemove: _removerMedicacao, 
                  );
                },
              ),
            ),
            
            const SizedBox(height: 15),
            const Text(
              "Histórico",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: _historicoAcoes.length,
                itemBuilder: (context, index) {
                  final acao = _historicoAcoes[index];
                  return HistoricoCard(acao: acao);
                },
              ),
            ),

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomElevatedButton(
                  onPressed: _navigateToAddMedicacao,
                  icon: Icons.add,
                  label: "Adicionar",
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}


//CARD DE MEDICAMENTO

class MedicamentoCard extends StatelessWidget {
  final Medicacao medicacao;
  final Function(Medicacao, bool) onAction; 
  final Function(Medicacao) onRemove;

  const MedicamentoCard({
    super.key,
    required this.medicacao,
    required this.onAction,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    const Color cardColor = Color.fromARGB(255, 230, 230, 230); 

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 55,
              height: 55,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                medicacao.horaFormatada,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 12),
        
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medicacao.nome,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    medicacao.dose,
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
            
            Column(
              children: [
                const Text("Tomei?"),
                const SizedBox(height: 5),
                Row(
                  children: [
                    CustomIconButton(
                      onPressed: () => onAction(medicacao, true),
                      icon: Icons.check,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 8),
                    CustomIconButton(
                      onPressed: () => onAction(medicacao, false),
                      icon: Icons.close,
                      color: Colors.red,
                    ),
                    const SizedBox(width: 20),
                 
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(
                      onPressed: () => onRemove(medicacao),
                      icon: Icons.delete_forever_outlined,
                      color: Colors.blueGrey,
                    )
              ],
            )
          ],
        ),
      ),
    );
  }
}


// CARD DE HISTÓRICO


class HistoricoCard extends StatelessWidget {
  final HistoricoAcao acao;

  const HistoricoCard({super.key, required this.acao});

  @override
  Widget build(BuildContext context) {
    final Color cardColor = acao.tomada ? Colors.green[200]! : Colors.red[200]!;
    final String statusText = acao.tomada ? "Tomou" : "Não Tomou";

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                acao.nomeMedicamento,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                "Previsto: ${acao.horaFormatadaPrevista}",
                style: const TextStyle(fontSize: 10, color: Colors.black54),
              ),
            ],
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                statusText,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: acao.tomada ? Colors.green[800] : Colors.red[800]),
              ),
              Text(
                "${acao.dataHoraFormatadaRegistro}",
                style: const TextStyle(fontSize: 10, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//botão com icon

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.color,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, size: 24),
      style: IconButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 233, 233, 233),
        foregroundColor: color,
        shape: const CircleBorder(),
        minimumSize: const Size.fromRadius(24),
      ),
    );
  }
}

//botão com icon e label

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        fixedSize: const Size.fromHeight(48),
      ),
    );
  }
}

//botão com icon e label

class RevCustomElevatedButton extends StatelessWidget {
  const RevCustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 233, 233, 233),
        foregroundColor: Colors.blue,
        fixedSize: const Size.fromHeight(48),
      ),
    );
  }
}

//navbar inferior

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (value) {},
      items: const [
        BottomNavigationBarItem(label: 'Lembretes', icon: Icon(Icons.alarm)),
        BottomNavigationBarItem(
          label: 'Adicionar',
          icon: Icon(Icons.alarm_add),
        ),
        BottomNavigationBarItem(
          label: 'Dados Vitais',
          icon: Icon(Icons.monitor_heart),
        ),
        BottomNavigationBarItem(
          label: 'Agenda',
          icon: Icon(Icons.calendar_today),
        ),
      ],
    );
  }
}
