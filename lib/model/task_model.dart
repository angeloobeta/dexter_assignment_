import 'package:dexter_assignment/model/imports/generalImport.dart';

class TaskModel {
  String? id;
  String? title;
  bool? isCompleted;
  bool? isPending;
  List? shift;
  String? description;
  String? createdBy;
  String? status;
  // DateTime? deadline;
  DateTime? createdAt;
  String? updatedAt;

  TaskModel({
    this.title,
    this.isCompleted,
    this.isPending,
    this.shift,
    this.description,
    this.createdBy,
    this.status,
    // this.deadline,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isCompleted': isCompleted,
      'isPending': isPending,
      'shift': shift,
      'description': description,
      'createdBy': createdBy,
      'status': status,
      // 'deadline': FieldValue.serverTimestamp(),
      'createdAt': FieldValue.serverTimestamp(),
      // 'updatedAt': updatedAt
    };
  }

  TaskModel.fromMap(DocumentSnapshot<Map<String, dynamic>> task)
      : title = task.data()!['title'],
        id = task.id,
        isCompleted = task.data()!['isCompleted'],
        isPending = task.data()!['isPending'],
        shift = task.data()!['shift'],
        description = task.data()!['description'],
        createdBy = task.data()!['createdBy'],
        status = task.data()!['status'],
        // deadline = task.data()!['deadline'].toDate(),
        createdAt = task.data()!['createdAt'].toDate();
  // updatedAt = task.data()!['updatedAt'];
}
