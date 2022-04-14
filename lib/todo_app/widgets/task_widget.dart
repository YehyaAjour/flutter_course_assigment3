import 'package:flutter/material.dart';
import 'package:state_managment/todo_app/models/task_model.dart';

class TaskWidget extends StatelessWidget {
  Function fun;
  Function deleteFun;
  Task task;

  TaskWidget(this.task, this.fun, this.deleteFun);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: task.isCompleted ? Colors.green : Colors.black45,
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: CheckboxListTile(
        title: Text(task.title),
        value: task.isCompleted,
        onChanged: (v) {
          fun(task);
        },
        secondary: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
            size: 30,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Delete Task"),
                  content: Text("Are You Sure To Delete This Task ?"),
                  actions: [
                    TextButton(
                      child: Text("No"),
                      onPressed: () {Navigator.pop(context);},
                    ),
                    TextButton(
                      child: Text("Yes"),
                      onPressed: () {deleteFun(task);Navigator.pop(context);},
                    ),
                  ],
                );
              },
            );

          },
        ),
      ),
    );
  }
}
