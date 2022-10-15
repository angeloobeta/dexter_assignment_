import 'package:dexter_assignment/model/imports/generalImport.dart';

class TaskModel {
  String? title;
  String? description;
  String? createdBy;
  String? status;
  DateTime? deadline;
  DateTime? createdAt;
  DateTime? updatedAt;

  TaskModel({
    this.title,
    this.description,
    this.createdBy,
    this.status,
    this.deadline,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'createdBy': createdBy,
      'status': status,
      'deadline': FieldValue.serverTimestamp(),
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp()
    };
  }

  TaskModel.fromMap(DocumentSnapshot<Map<String, dynamic>> task)
      : title = task.data()!['title'],
        description = task.data()!['description'],
        createdBy = task.data()!['createdBy'],
        status = task.data()!['status'],
        deadline = task.data()!['deadline'].toDate(),
        createdAt = task.data()!['createdAt'].toDate(),
        updatedAt = task.data()!['updatedAt'].toDate();
}
