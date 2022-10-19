part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class GetAllTasksEvent extends TaskEvent {
  @override
  List<Object?> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final TaskModel taskModel;

  AddTaskEvent(this.taskModel);
  @override
  List<Object?> get props => [];
}

class UpdateTaskEvent extends TaskEvent {
  final TaskModel todoModel;
  final String id;

  UpdateTaskEvent(this.todoModel, this.id);

  @override
  List<Object?> get props => [];
}

class DeleteTaskEvent extends TaskEvent {
  final String id;
  final TaskModel todoModel;

  DeleteTaskEvent(this.id, this.todoModel);

  @override
  List<Object?> get props => [];
}
