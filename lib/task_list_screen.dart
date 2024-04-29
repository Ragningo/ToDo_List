import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalhoflutterdppm/add_task_screen.dart';
import 'provider/task_provider.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, _) {
          return ListView.builder(
            itemCount: taskProvider.tasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(taskProvider.tasks[index].title),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    taskProvider.removeTask(index);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}