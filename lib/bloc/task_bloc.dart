 
 

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:todo_task_app/Models/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  //todo    Add Data

  void _onAddTask(AddTask event, Emitter<TaskState> emit){
    final state=this.state;
    List data= state.allTask;
    emit(TaskState( allTask: List.from(state.allTask)
                            ..add(event.task),
    
    
    ));

  }
  //todo Update 
   void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit){
    final state= this.state;
    final task= event.task;
    final index=state.allTask.indexOf(task);
    List <Task> allTask= List.from(state.allTask)..remove(task);
    task.isDone==false? allTask.insert(index,task.copyWith(isDone: true)):allTask.insert(index,task.copyWith(isDone: false));
    emit(TaskState(allTask: allTask));






   }
   //todo Delete
   void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit){

    emit(TaskState(allTask: List.from(state.allTask)..remove(event.task)));
 

   }
   
     @override
     TaskState? fromJson(Map<String, dynamic> json) {
   return TaskState.fromMap(json);
     }
   
     @override
     Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap( );
     }
}
