part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();
}

class TaskInitial extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskLoadingState extends TaskState {
  @override
  List<Object?> get props => [];
}

class TaskLoadedState extends TaskState {
  final List<TaskModel> taskList;

  TaskLoadedState(this.taskList);
  @override
  List<Object?> get props => [];
}

class TaskErrorState extends TaskState {
  final String errorMessage;

  TaskErrorState(this.errorMessage);
  @override
  List<Object?> get props => [];
}

class TaskAddedState extends TaskState {
  @override
  List<Object?> get props => [];
}
