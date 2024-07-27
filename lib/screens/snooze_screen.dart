import 'package:flutter/material.dart';

class SelectSnoozeScreen extends StatelessWidget {
  final String selectedSnooze;

  const SelectSnoozeScreen({super.key, required this.selectedSnooze});

  @override
  Widget build(BuildContext context) {
    String currentSnooze = selectedSnooze;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select snooze'),
      ),
      body: Center(
        child: DropdownButton<String>(
          value: currentSnooze,
          items: ['5mins', '10mins', '15mins'].map((String value) {
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
