import 'package:adaptnxt/screens/select_tune_scree.dart';
import 'package:adaptnxt/screens/snooze_screen.dart';
import 'package:adaptnxt/screens/strength_screen.dart';
import 'package:flutter/material.dart';

class DeviceSettingsScreen extends StatefulWidget {
  const DeviceSettingsScreen({super.key});

  @override
  _DeviceSettingsScreenState createState() => _DeviceSettingsScreenState();
}

class _DeviceSettingsScreenState extends State<DeviceSettingsScreen> {
  bool _isVacationTimeSet = false;
  bool _showMedsName = false;
  bool _notifyPharma = false;
  bool _addSorryTime = false;
  String _selectedTune = 'Rooster';
  String _selectedStrength = 'Louder';
  String _selectedSnooze = '5mins';

  DateTime? _startDate;
  DateTime? _endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Device settings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Set vacation time
              Card(
                child: ListTile(
                  title: const Text('Set vacation time'),
                  trailing: Switch(
                    value: _isVacationTimeSet,
                    onChanged: (value) {
                      setState(() {
                        _isVacationTimeSet = value;
                      });
                    },
                  ),
                ),
              ),
              if (_isVacationTimeSet)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16.0),
                    // Start date & time
                    const Text('Start date & time'),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: _startDate ?? DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (pickedDate != null) {
                                setState(() {
                                  _startDate = pickedDate;
                                });
                              }
                            },
                            child: Container(
                              height: 48,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _startDate != null
                                        ? '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}'
                                        : 'DD/MM/YYYY',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const Icon(Icons.calendar_today),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: _startDate != null
                                    ? TimeOfDay.fromDateTime(_startDate!)
                                    : const TimeOfDay(hour: 0, minute: 0),
                              );
                              if (pickedTime != null) {
                                setState(() {
                                  _startDate = DateTime(
                                    _startDate?.year ?? DateTime.now().year,
                                    _startDate?.month ?? DateTime.now().month,
                                    _startDate?.day ?? DateTime.now().day,
                                    pickedTime.hour,
                                    pickedTime.minute,
                                  );
                                });
                              }
                            },
                            child: Container(
                              height: 48,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _startDate != null
                                        ? '${_startDate!.hour}:${_startDate!.minute}'
                                        : 'HH:MM',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const Icon(Icons.access_time),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    // End date & time
                    const Text('End date & time'),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: _endDate ?? DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (pickedDate != null) {
                                setState(() {
                                  _endDate = pickedDate;
                                });
                              }
                            },
                            child: Container(
                              height: 48,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _endDate != null
                                        ? '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}'
                                        : 'DD/MM/YYYY',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const Icon(Icons.calendar_today),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: _endDate != null
                                    ? TimeOfDay.fromDateTime(_endDate!)
                                    : const TimeOfDay(hour: 0, minute: 0),
                              );
                              if (pickedTime != null) {
                                setState(() {
                                  _endDate = DateTime(
                                    _endDate?.year ?? DateTime.now().year,
                                    _endDate?.month ?? DateTime.now().month,
                                    _endDate?.day ?? DateTime.now().day,
                                    pickedTime.hour,
                                    pickedTime.minute,
                                  );
                                });
                              }
                            },
                            child: Container(
                              height: 48,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _endDate != null
                                        ? '${_endDate!.hour}:${_endDate!.minute}'
                                        : 'HH:MM',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const Icon(Icons.access_time),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32.0),
                  ],
                ),
              // Show meds name
              Card(
                child: ListTile(
                  title: const Text('Show meds name'),
                  trailing: Switch(
                    value: _showMedsName,
                    onChanged: (value) {
                      setState(() {
                        _showMedsName = value;
                      });
                    },
                  ),
                ),
              ),
              // Notify pharma to autofill
              Card(
                child: ListTile(
                  title: const Text('Notify pharma to autofill'),
                  trailing: Switch(
                    value: _notifyPharma,
                    onChanged: (value) {
                      setState(() {
                        _notifyPharma = value;
                      });
                    },
                  ),
                ),
              ),
              // Add sorry time
              Card(
                child: ListTile(
                  title: const Text('Add sorry time'),
                  trailing: Switch(
                    value: _addSorryTime,
                    onChanged: (value) {
                      setState(() {
                        _addSorryTime = value;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 1.0),
              // Occupied cabinets
              const Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Occupied Cabinets'),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text('1,2,3,4,5'),
                  ],
                ),
              ),

              Card(
                child: ListTile(
                  title: const Text('Alarm tune'),
                  trailing: Text(_selectedTune),
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SelectTuneScreen(selectedTune: _selectedTune)),
                    );
                    if (result != null) {
                      setState(() {
                        _selectedTune = result;
                      });
                    }
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Alarm strength'),
                  trailing: Text(_selectedStrength),
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectStrengthScreen(
                              selectedStrength: _selectedStrength)),
                    );
                    if (result != null) {
                      setState(() {
                        _selectedStrength = result;
                      });
                    }
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Snooze'),
                  trailing: Text(_selectedSnooze),
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectSnoozeScreen(
                              selectedSnooze: _selectedSnooze)),
                    );
                    if (result != null) {
                      setState(() {
                        _selectedSnooze = result;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
