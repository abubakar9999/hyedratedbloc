// ignore_for_file: public_member_api_docs, sort_constructors_first
 

part of 'task_bloc.dart';

class TaskState extends Equatable {
    List<Task> allTask;
    TaskState({this.allTask = const<Task> []});
  
  @override
  List<Object> get props => [allTask];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allTask': allTask.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      allTask: List<Task>.from((map['allTask'] as List<int>).map<Task>((x) => Task.fromMap(x as Map<String,dynamic>),),),
    );
  }
 
}

 
