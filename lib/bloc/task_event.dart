part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class GetAllTasksEvent extends TaskEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final TaskModel taskModel;

  AddTaskEvent(this.taskModel);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// class UpdateTaskEvent extends TaskEvent {
//   final TaskModel taskModel;
//
//   UpdateTaskEvent(this.taskModel);
//   @override
//   List<Object> get props => [];
// }
