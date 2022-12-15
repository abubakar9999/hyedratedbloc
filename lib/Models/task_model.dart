 
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable{

  final String title;
  String id;
  bool? isDone;
  bool? isDeleteed;
  Task({
    required this.title,
    required this.id,
      this.isDone,
      this.isDeleteed,
  }){
    isDone=isDone ?? false;
    isDeleteed = isDeleteed ?? false;
  }
  
  



  Task copyWith({
    String? title,
    String? id,
    bool? isDone,
    bool? isDeleteed,
  }) {
    return Task(
      title: title ?? this.title,
      id:id ?? this.id,
      isDone: isDone ?? this.isDone,
      isDeleteed: isDeleteed ?? this.isDeleteed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      "id":id,
      'isDone': isDone,
      'isDeleteed': isDeleteed,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? "",
      id:map['id'],
      isDone: map['isDone'] ,
      isDeleteed: map['isDeleteed'] ,
    );
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [title,id,isDone,isDeleteed];
 
}
