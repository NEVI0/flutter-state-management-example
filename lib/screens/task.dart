import 'package:flutter/material.dart';
import 'package:flutter_state_management_example/models/task.dart';
import 'package:provider/provider.dart';

import 'package:flutter_state_management_example/widgets/add_task_modal.dart';
import 'package:flutter_state_management_example/widgets/list_item.dart';

import 'package:flutter_state_management_example/provider/task_data.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  Widget buildBottomModalSheet(BuildContext context) => const AddTaskModal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Consumer<TaskData>(
          builder: (context, taskData, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.list,
                            size: 32,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24,),
                      const Text('Todoey App', style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),),
                      const SizedBox(height: 4,),
                      Text('${taskData.tasks.length} tasks', style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      ),),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(48),
                        topRight: Radius.circular(48),
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: taskData.tasks.length,
                      itemBuilder: (context, index) {
                        final TaskModel task = taskData.tasks[index];

                        return ListItem(
                          name: task.name, 
                          isChecked: task.isDone,
                          onCheck: () => taskData.update(task),
                          onLongPress: () => taskData.delete(task),
                        );
                      }
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, builder: buildBottomModalSheet);
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}