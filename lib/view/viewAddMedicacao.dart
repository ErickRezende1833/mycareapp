import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/medicacao.dart'; 
import 'package:flutter_application_1/view/viewMedicacao.dart'; 

class ViewAddMedicacao extends StatefulWidget {
  const ViewAddMedicacao({super.key});

  @override
  State<ViewAddMedicacao> createState() => _ViewAddMedicacaoState();
}

class _ViewAddMedicacaoState extends State<ViewAddMedicacao> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _doseController = TextEditingController();
  TimeOfDay? _horarioSelecionado;
  bool _isLoading = false;

  void _submitForm() async {
    if (_isLoading) return;

    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(const Duration(seconds: 1));

      final novaMedicacao = Medicacao(
        nome: _nomeController.text,
        dose: _doseController.text,
        horario: _horarioSelecionado!,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Medicamento adicionado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context, novaMedicacao);
    }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _doseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/logotipo.png',
          height: 40,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Adicionar Medicamento",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: _nomeController,
                      labelText: "Nome do medicamento",
                      hintText: "",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O nome do medicamento é obrigatório.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: _doseController,
                      labelText: "Dose",
                      hintText: "(ex: 100ml/1 comprimido)",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'A dose é obrigatória.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTimePickerField(
                      labelText: "Horário da medicação",
                      onTimeSelected: (time) {
                        _horarioSelecionado = time;
                      },
                      validator: (value) {
                        if (_horarioSelecionado == null) {
                          return 'O horário é obrigatório.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomElevatedButton(
                          onPressed: _submitForm,
                          icon: Icons.save,
                          label: "Salvar",
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 0),
    );
  }
}

//campo com timepicker

class CustomTimePickerField extends StatefulWidget {
  final String labelText;
  final ValueChanged<TimeOfDay?> onTimeSelected;
  final String? Function(String?)? validator;

  const CustomTimePickerField({
    Key? key,
    required this.labelText,
    required this.onTimeSelected,
    this.validator,
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
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: const Icon(Icons.access_time),
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
    this.validator,
  });

  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
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

