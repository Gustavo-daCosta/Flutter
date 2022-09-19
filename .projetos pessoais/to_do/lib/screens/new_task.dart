import 'package:flutter/material.dart';
import 'package:to_do/models/task.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class NewTaskPage extends StatelessWidget {
  final Task? task;

  final DateFormat format = DateFormat("dd-MM-yyyy");
  final TextEditingController _taskNameController = TextEditingController();
  final DateTime now = DateTime.now();

  NewTaskPage({
    Key? key,
    this.task,
  }) : super(key: key);

  // Avaliar se há necessidade de remover o padding geral e
  // colocar o padding individualmente nos widgets que necessitam

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${task == null ? 'New' : 'Edit'} Task")
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                icon: Icon(Icons.add_task_rounded),
                labelText: "Task Title",
                labelStyle: TextStyle(fontSize: 24),
                border: OutlineInputBorder(),
              ),
              controller: _taskNameController,
              maxLength: 48,
            ),
            Divider(
              color: Colors.blueGrey[300],
            ),
            DateTimeField(
              format: format,
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                  context: context,
                  firstDate: DateTime(now.year, now.month, now.day),
                  initialDate: DateTime(now.year, now.month, now.day),
                  lastDate: DateTime(now.year + 100)
                );
              },
            )
          ],
        ),
      ),
    );
  }
}