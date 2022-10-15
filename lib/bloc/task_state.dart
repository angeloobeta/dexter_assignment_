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
  // TODO: implement props
  List<Object?> get props => [];
}

class TaskLoadedState extends TaskState {
  final List<TaskModel> taskList;

  TaskLoadedState(this.taskList);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TaskErrorState extends TaskState {
  final String errorMessage;

  TaskErrorState(this.errorMessage);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
