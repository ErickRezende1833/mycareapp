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
          children: [
            Text("aaa"),
            CustomTextField(labelText: "aaa", hintText: "ddd"),
            CustomElevatedButton(onPressed: (){}, icon: Icons.add, label: "Salvar")
            
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar()
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
              onPressed: () {},
              icon: Icon(icon, size: 18),
              label: Text(label),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                )
            );
  }

}

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  backgroundColor: Color(0xFF6200EE),
  selectedItemColor: Colors.white,
  unselectedItemColor: Colors.white.withOpacity(.60),
  selectedFontSize: 14,
  unselectedFontSize: 14,
  onTap: (value) {
    // Respond to item press.
  },
  items: [
    BottomNavigationBarItem(
      label: 'Favorites',
      icon: Icon(Icons.alarm_add),
    ),
    BottomNavigationBarItem(
      label: 'Favorites',
      icon: Icon(Icons.music_note),
    ),
    BottomNavigationBarItem(
      label: 'Favorites',
      icon: Icon(Icons.location_on),
    ),
    BottomNavigationBarItem(
      label: 'Favorites',
      icon: Icon(Icons.library_books),
    ),
  ],
);
  }
}


