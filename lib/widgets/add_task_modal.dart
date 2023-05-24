import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_state_management_example/provider/task_data.dart';

class AddTaskModal extends StatelessWidget {
  const AddTaskModal({super.key});

  @override
  Widget build(BuildContext context) {
    String taskName = '';

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Add task',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlueAccent
            ),
          ),
          const SizedBox(height: 12,),
          TextField(
            onChanged: (newValue) {
              taskName = newValue;
            },
          ),
          TextButton(
            onPressed: () {
              Provider.of<TaskData>(context, listen: false).add(taskName);
              Navigator.pop(context);
            },
            child: const Text('Add')
          ),
        ],
      ),
    );
  }
}