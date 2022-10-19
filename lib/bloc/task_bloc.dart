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
    on<UpdateTaskEvent>(_mapUpdateTaskEventToState);
    on<DeleteTaskEvent>(_mapDeleteTaskEventToState);
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

  FutureOr<void> _mapUpdateTaskEventToState(
      UpdateTaskEvent event, Emitter<TaskState> emit) async {
    emit(TaskLoadingState());
    try {
      await repository!.updateTask(event.todoModel, event.id);
    } catch (e) {
      emit(TaskErrorState(e.toString()));
    }
  }

  FutureOr<void> _mapDeleteTaskEventToState(
      DeleteTaskEvent event, Emitter<TaskState> emit) async {
    emit(TaskLoadingState());
    try {
      await repository!.deleteTask(event.todoModel, event.id);
    } catch (e) {
      emit(TaskErrorState(e.toString()));
    }
  }
}
