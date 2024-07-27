
import 'package:flutter/material.dart';

class SelectStrengthScreen extends StatelessWidget {
  final String selectedStrength;

  SelectStrengthScreen({required this.selectedStrength});

  @override
  Widget build(BuildContext context) {
    String currentStrength = selectedStrength;
    return Scaffold(
      appBar: AppBar(
        title: Text('Select strength'),
      ),
      body: Center(
        child: DropdownButton<String>(
          value: currentStrength,
          items: ['Low', 'Medium', 'Louder'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              Navigator.pop(context, value);
            }
          },
        ),
      ),
    );
  }
}
