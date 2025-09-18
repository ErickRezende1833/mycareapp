import 'package:flutter/material.dart';

class AddMedicacao extends StatelessWidget {
  const AddMedicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset(
          'images/logotipo.png',
          height: 40,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Adicionar lembrete",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            SizedBox(height: 10,),
            CustomTextField(labelText: "aaa", hintText: "ddd"),
            SizedBox(height: 10,),
            CustomTextField(labelText: "aaa", hintText: "ddd"),
            SizedBox(height: 10,),

            const CustomTimePickerField(labelText: "Horário da medicação"),

            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(onPressed: (){}, icon: Icons.delete_forever_outlined),
                CustomElevatedButton(onPressed: (){}, icon: Icons.add, label: "Salvar")
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class CustomTimePickerField extends StatefulWidget {
  final String labelText;

  const CustomTimePickerField({
    Key? key,
    required this.labelText,
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
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
        _controller.text = selectedTime!.format(context);
      });
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
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.labelText,
        suffixIcon: const Icon(Icons.access_time),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, size: 24),
      style: IconButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 233, 233, 233),
        foregroundColor: Colors.blue,
        shape: const CircleBorder(),
        minimumSize: const Size.fromRadius(24),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
  });

  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}

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
        // Lógica para navegação
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