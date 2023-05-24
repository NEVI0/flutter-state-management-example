import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_state_management_example/screens/task.dart';
import 'package:flutter_state_management_example/provider/task_data.dart';

void main() {
  runApp(const StateManagementApp());
}

class StateManagementApp extends StatelessWidget {
  const StateManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: const MaterialApp(
        home: TaskScreen()
      ),
    );
  }
}
