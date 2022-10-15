import 'package:dexter_assignment/model/imports/generalImport.dart';

class TodoTaskRepository {
  Future<void> saveTodo(TodoTaskModel todo) async {
    try {
      await FirestoreReference.todoRef.add(todo.toMap());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<TodoTaskModel>> fetchAllTasks() async {
    QuerySnapshot<Map<String, dynamic>> todoList =
        await FirestoreReference.todoRef.get();
    return todoList.docs
        .map((QueryDocumentSnapshot<Map<String, dynamic>> todo) =>
            TodoTaskModel.fromFirestore(todo))
        .toList();
  }

  Future<void> updateTodo(TodoTaskModel todoModel, String id) async {
    try {
      await FirestoreReference.todoRef.doc(id).update(todoModel.toMap());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> deleteTodo(TodoTaskModel todo, String id) async {
    try {
      await FirestoreReference.todoRef.doc(id).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
