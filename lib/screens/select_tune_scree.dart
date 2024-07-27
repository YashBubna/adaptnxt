import 'package:flutter/material.dart';

class SelectTuneScreen extends StatelessWidget {
  final String selectedTune;

  const SelectTuneScreen({super.key, required this.selectedTune});

  @override
  Widget build(BuildContext context) {
    String currentTune = selectedTune;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select tune'),
      ),
      body: Center(
        child: DropdownButton<String>(
          value: currentTune,
          items: ['Chimes', 'Rooster', 'Sweet piano'].map((String value) {
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
