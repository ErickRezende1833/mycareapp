import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/medicacao.dart'; 

class ViewAddMedicacao extends StatelessWidget {
  const ViewAddMedicacao({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController _nomeController = TextEditingController();
    final TextEditingController _doseController = TextEditingController();
    TimeOfDay? _horarioSelecionado;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/logotipo.png',
          height: 40,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Adicionar lembrete",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10,),
            CustomTextField(
              controller: _nomeController,
              labelText: "Nome do medicamento",
              hintText: "",
            ),
            const SizedBox(height: 10,),
            CustomTextField(
              controller: _doseController,
              labelText: "Dose",
              hintText: "(ex: 100ml/1 comprimido)",
            ),
            const SizedBox(height: 10,),

            CustomTimePickerField(
              labelText: "Horário da medicação",
              onTimeSelected: (time) {
                _horarioSelecionado = time;
              },
            ),

            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  onPressed: () {
                    Navigator.pop(context); 
                  }, 
                  icon: Icons.delete_forever_outlined,
                  color: Colors.blue,
                ),
                CustomElevatedButton(
                  onPressed: () {
                    if (_nomeController.text.isEmpty ||
                        _doseController.text.isEmpty ||
                        _horarioSelecionado == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Por favor, preencha todos os campos.')),
                      );
                      return;
                    }

                    final novaMedicacao = Medicacao(
                      nome: _nomeController.text,
                      dose: _doseController.text,
                      horario: _horarioSelecionado!,
                    );

                    Navigator.pop(context, novaMedicacao);
                  },
                  icon: Icons.add,
                  label: "Salvar",
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

//campo com timepicker

class CustomTimePickerField extends StatefulWidget {
  final String labelText;
  final ValueChanged<TimeOfDay?> onTimeSelected;

  const CustomTimePickerField({
    Key? key,
    required this.labelText,
    required this.onTimeSelected,
  }) : super(key: key);

  @override
  State<CustomTimePickerField> createState() => _CustomTimePickerFieldState();
}

class _CustomTimePickerFieldState extends State<CustomTimePickerField> {
  TimeOfDay? selectedTime;
  final TextEditingController _controller = TextEditingController();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              surface: Colors.white,
              primary: Colors.blue,
              onSurface: Colors.black87,
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
        _controller.text = picked.format(context);
      });
      widget.onTimeSelected(selectedTime);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      onTap: () => _selectTime(context),
      decoration: const InputDecoration(
        labelText: "Horário da medicação",
        suffixIcon: Icon(Icons.access_time),
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
    this.color = Colors.blue,
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

//campo de texto

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
  });

  final String labelText;
  final String hintText;
  final TextEditingController? controller; 
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
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
      onTap: (value) {
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Lembretes',
          icon: Icon(Icons.alarm),
        ),
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