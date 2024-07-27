import 'package:adaptnxt/screens/add_medicine_info.dart';
import 'package:adaptnxt/screens/device_settings.dart';
import 'package:adaptnxt/screens/select_tune_scree.dart';
import 'package:adaptnxt/screens/snooze_screen.dart';
import 'package:adaptnxt/screens/strength_screen.dart';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DeviceSettingsScreen(),
    );
  }
}

