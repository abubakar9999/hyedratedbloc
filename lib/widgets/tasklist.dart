

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_app/bloc/task_bloc.dart';

import '../Models/task_model.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;  

  @override
  Widget build(BuildContext context) {
    return Expanded(
       
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: taskList.length,
        itemBuilder: (BuildContext context, int index) {
          var tasks= taskList[index]; 
          return ListTile(
            title: Text(tasks.title),
            trailing: Checkbox(value:tasks.isDone , 
            onChanged: (value){
              context.read<TaskBloc>().add(UpdateTask(task: tasks));

              print("valllllllllllllllllll: $value");
    
    
            }),
            onLongPress: () {
              context.read<TaskBloc>().add(DeleteTask(task: tasks));

              print(tasks);
            }
    
    
    
          );
        },
      ),
    );
  }
}