import 'package:flutter/material.dart';

class AddMedicineInfoScreen extends StatefulWidget {
  const AddMedicineInfoScreen({super.key});

  @override
  _AddMedicineInfoScreenState createState() => _AddMedicineInfoScreenState();
}

class _AddMedicineInfoScreenState extends State<AddMedicineInfoScreen> {
  final TextEditingController _medicineNameController = TextEditingController();
  String _frequency = 'Daily';
  final List<TimeOfDay> _alarmTimes = [const TimeOfDay(hour: 8, minute: 0)];
  final List<TextEditingController> _doseControllers = [
    TextEditingController(text: '5 ml')
  ];

  void _addAlarm() {
    setState(() {
      _alarmTimes.add(const TimeOfDay(hour: 8, minute: 0));
      _doseControllers.add(TextEditingController(text: '5 ml'));
    });
  }

  void _setTime(int index, TimeOfDay time) {
    setState(() {
      _alarmTimes[index] = time;
    });
  }

  Future<void> _selectTime(BuildContext context, int index) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _alarmTimes[index],
    );
    if (picked != null) _setTime(index, picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Medicine Info'),
        actions: [
          TextButton(
            onPressed: () {
              // Add functionality to save medicine info
            },
            child: const Text('Next', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _medicineNameController,
              decoration: const InputDecoration(
                labelText: 'Medicine name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Frequency'),
            ListTile(
              title: const Text('Daily'),
              leading: Radio<String>(
                value: 'Daily',
                groupValue: _frequency,
                onChanged: (String? value) {
                  setState(() {
                    _frequency = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Specific days'),
              leading: Radio<String>(
                value: 'Specific days',
                groupValue: _frequency,
                onChanged: (String? value) {
                  setState(() {
                    _frequency = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Interval'),
              leading: Radio<String>(
                value: 'Interval',
                groupValue: _frequency,
                onChanged: (String? value) {
                  setState(() {
                    _frequency = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('As needed'),
              leading: Radio<String>(
                value: 'As needed',
                groupValue: _frequency,
                onChanged: (String? value) {
                  setState(() {
                    _frequency = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text('Set time & dose'),
            ..._alarmTimes.asMap().entries.map((entry) {
              int index = entry.key;
              TimeOfDay time = entry.value;
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _selectTime(context, index),
                          child: AbsorbPointer(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Time',
                                hintText: time.format(context),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _doseControllers[index],
                          decoration: const InputDecoration(
                            labelText: 'Dose',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              );
            }),
            TextButton(
              onPressed: _addAlarm,
              child: const Text('+ Add more alarm'),
            ),
          ],
        ),
      ),
    );
  }
}
