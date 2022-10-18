import 'imports/generalImport.dart';

class TodoTaskModel {
  late String title;
  late String id;
  late bool isComplete;
  late bool isPending;
  late String description;
  late DateTime createdAt;
  late DateTime updatedAt;

  TodoTaskModel(
      {required this.title,
      required this.isComplete,
      required this.description,
      required this.updatedAt,
      required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isComplete': isComplete,
      'description': description,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }

  TodoTaskModel.fromFirestore(QueryDocumentSnapshot<Map<String, dynamic>> todo)
      : id = todo.id,
        title = todo.data()['title'],
        description = todo.data()['description'],
        createdAt = todo.data()['createdAt'].toDate(),
        updatedAt = todo.data()['updatedAt'].toDate();
}
