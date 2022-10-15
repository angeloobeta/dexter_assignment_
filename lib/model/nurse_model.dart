import 'package:dexter_assignment/model/imports/generalImport.dart';

class NurseModel {
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;

  NurseModel({
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }

  NurseModel.fromMap(DocumentSnapshot<Map<String, dynamic>> nurse)
      : id = nurse.id,
        name = nurse.data()!['name'],
        createdAt = nurse.data()!['createdAt'].toDate(),
        updatedAt = nurse.data()!['updatedAt'].toDate();
}
