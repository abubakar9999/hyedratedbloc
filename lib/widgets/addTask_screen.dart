
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task_app/Models/task_model.dart';
import 'package:todo_task_app/bloc/task_bloc.dart';
import 'package:uuid/uuid.dart';

class AddTasks extends StatelessWidget {
  const AddTasks({
    Key? key,
    required this.titleControler,
  }) : super(key: key);

  final TextEditingController titleControler;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text("Add Task",style: TextStyle(fontSize: 24),),
          SizedBox(height: 20,),
          TextField(
            autofocus: true,
            controller: titleControler,
            decoration: InputDecoration(
              label: Text("Title"),
              border: OutlineInputBorder()
              
            ),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: ()=>Navigator.pop(context), child: Text("Cancel")),
              TextButton(onPressed: (){
                var task=Task(
                  title: titleControler.text,
                  id: Uuid().v1().toString(),
                
                
                );
                context.read<TaskBloc>().add(AddTask(task: task));
                Navigator.pop(context);
              }, child: Text("Add")),
            ],
          ),

          SizedBox(height: 100,)

        ],
      ),
    );
  }
}
