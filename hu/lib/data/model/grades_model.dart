import 'package:hu/domain/entity/grades.dart';

class GradesModel extends Grades {
  GradesModel(
      {required super.assignment,
      required super.course,
      required super.finalExam,
      required super.midTerm});
  factory GradesModel.fromJson(Map<String, dynamic> json) => GradesModel(
      assignment: double.parse(json['assignment'].toString()),
      course: json['course'],
      finalExam: double.parse(json['final'].toString()),
      midTerm: double.parse(json['mid'].toString()));
}
