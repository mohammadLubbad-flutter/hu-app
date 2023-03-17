import 'package:hu/domain/entity/course.dart';

class CourseModel extends Course {
  CourseModel(
      {required super.days,
      required super.assignment,
      required super.exam,
      required super.notes,
      required super.name,
      required super.place,
      required super.time});

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
      days: json['day'],
      name: json['name'],
      time: json['time'],
      assignment: DateTime.parse(json['assignment']),
      exam: DateTime.parse(json['exam']),
      notes: json['note'],
      place: json['place']);
}
