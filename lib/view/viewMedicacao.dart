import 'package:flutter/material.dart';

class ViewMedicacao extends StatelessWidget {
  const ViewMedicacao({super.key});

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
            Text(
              "Meus Medicamentos",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 5),

            MedicamentoCard(
              hora: "08:00",
              nomeMedicamento: "Diazepan",
              dose: "1g",
            ),
            MedicamentoCard(
              hora: "16:00",
              nomeMedicamento: "Diazepan",
              dose: "1g",
            ),

            SizedBox(height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  onPressed: () {},
                  icon: Icons.menu,
                  color: Colors.blue,
                ),
                RevCustomElevatedButton(
                  onPressed: () {},
                  icon: Icons.delete_forever_outlined,
                  label: "Remover",
                ),
                CustomElevatedButton(
                  onPressed: () {},
                  icon: Icons.add,
                  label: "Adicionar",
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

//card de remedio

class MedicamentoCard extends StatelessWidget {
  final String hora;
  final String nomeMedicamento;
  final String dose;

  const MedicamentoCard({
    super.key,
    required this.hora,
    required this.nomeMedicamento,
    required this.dose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[300],
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
                hora,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 12),
            // Informações de medicamento
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nomeMedicamento,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    dose,
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text("Tomei?"),
                SizedBox(height: 5),
                Row(
                  children: [
                    CustomIconButton(
                      onPressed: () {},
                      icon: Icons.check,
                      color: Colors.green,
                    ),
                    SizedBox(width: 8),
                    CustomIconButton(
                      onPressed: () {},
                      icon: Icons.close,
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
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
