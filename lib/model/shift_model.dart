import 'package:dexter_assignment/model/imports/generalImport.dart';

class ShiftModel {
  String? shiftType;
  String? createdBy;
  String? id;
  DateTime? startTime;
  DateTime? endTime;
  DateTime? createdAt;
  DateTime? updatedAt;

  ShiftModel({
    this.shiftType,
    this.createdBy,
    this.startTime,
    this.endTime,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'shiftType': shiftType,
      'createdBy': createdBy,
      'startTime': FieldValue.serverTimestamp(),
      'endTime': FieldValue.serverTimestamp(),
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }

  ShiftModel.fromMap(DocumentSnapshot<Map<String, dynamic>> shift)
      : shiftType = shift.data()!['shiftType'],
        createdBy = shift.data()!['createdBy'],
        id = shift.id,
        startTime = shift.data()!['startTime'].toDate(),
        endTime = shift.data()!['endTime'].toDate(),
        createdAt = shift.data()!['createdAt'].toDate(),
        updatedAt = shift.data()!['updatedAt'].toDate();
}
