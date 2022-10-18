import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dexter_assignment/Repository/FirestoreReference.dart';
import 'package:dexter_assignment/utility.dart';

import '../model/task_model.dart';

class TaskRepository {
  Future<void> saveTask(TaskModel task) async {
    try {
      await FirestoreReference.taskRef.add(task.toMap());
      Utility.showToast('Task saved successfully');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateTask(String taskId) async {
    try {
      await FirestoreReference.taskRef
          .doc(taskId)
          .update({'pending': 'completed'});
      Utility.showToast('Task updated');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<TaskModel>> getAllTask() async {
    try {
      QuerySnapshot<Map<String, dynamic>> taskList =
          await FirestoreReference.taskRef.get();
      print("Get all task was called");
      print(taskList);
      return taskList.docs.map((task) => TaskModel.fromMap(task)).toList();
    } catch (e) {
      print("Get all task fail to execute");
      throw Exception(e.toString());
    }
  }

  Future<List<TaskModel>> fetchPendingTasks() async {
    try {
      QuerySnapshot<Map<String, dynamic>> taskList = await FirestoreReference
          .taskRef
          .where('status', isEqualTo: 'pending')
          .get();
      return taskList.docs.map((task) => TaskModel.fromMap(task)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
