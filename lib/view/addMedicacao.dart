import 'package:flutter/material.dart';

class AddMedicacao extends StatelessWidget {
  const AddMedicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("aaaa"),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),),
      body: Padding(padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomTextField(labelText: "aaa", hintText: "ddd")
        ],
      ),)
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText
  });

  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: labelText,
              hintText: hintText
            ),
          );
  }
}


