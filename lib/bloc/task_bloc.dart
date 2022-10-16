import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../Repository/task_repository.dart';
import '../model/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskRepository? repository;

  TaskBloc({this.repository}) : super(TaskInitial()) {
    on<GetAllTasksEvent>(_mapGetAllTasksEventToState);
    on<AddTaskEvent>(_mapAddTaskEvent);
  }

  FutureOr<void> _mapGetAllTasksEventToState(
      GetAllTasksEvent event, Emitter<TaskState> emit) async {
    emit(TaskLoadingState());
    try {
      List<TaskModel> tasks = await repository!.getAllTask();
      emit(TaskLoadedState(tasks));
    } catch (e) {
      emit(TaskErrorState(e.toString()));
    }
  }

  FutureOr<void> _mapAddTaskEvent(
      AddTaskEvent event, Emitter<TaskState> emit) async {
    emit(TaskLoadingState());
    try {
      await repository!.saveTask(event.taskModel);
    } catch (e) {
      emit(TaskErrorState(e.toString()));
    }
  }
}
