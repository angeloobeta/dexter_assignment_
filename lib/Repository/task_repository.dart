import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dexter_assignment/Repository/FirestoreReference.dart';

import '../model/task_model.dart';

class TaskRepository {
  Future<void> saveTask(TaskModel task) async {
    try {
      await FirestoreReference.taskRef.add(task.toMap());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<TaskModel>> getAllTask() async {
    try {
      QuerySnapshot<Map<String, dynamic>> taskList =
          await FirestoreReference.taskRef.get();
      return taskList.docs.map((task) => TaskModel.fromMap(task)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
