part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class GetAllTasksEvent extends TaskEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
