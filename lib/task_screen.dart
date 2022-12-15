 

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_app/bloc/task_bloc.dart';
import 'package:todo_task_app/widgets/addTask_screen.dart';
import 'package:todo_task_app/widgets/tasklist.dart';

import 'Models/task_model.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({Key? key}) : super(key: key);
  TextEditingController titleControler =TextEditingController();

  void _addTask(BuildContext context){
    showModalBottomSheet(context: context, builder: ((context) => SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom
        ),
        child: AddTasks(titleControler: titleControler),
    ))));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList=state.allTask;
        return Scaffold(
          appBar: AppBar(
            title: Text("Task App"),
            actions: [
              IconButton(onPressed: () {
                 _addTask(context);

              }, icon: Icon(Icons.add)),
            ],
          ),
          body: Column(
            children: <Widget>[
              Center(child: Chip(label: Text("Task :"))),
              TaskList(taskList: taskList),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _addTask(context);
            },
            child: Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("add Task"),
            )),
          ),
        );
      },
    );
  }
}
