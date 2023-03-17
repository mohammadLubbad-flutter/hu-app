import 'package:hu/domain/entity/student.dart';

class StudentModel extends Student {
  StudentModel(
      {required super.coursessId,
      required super.image,
      required super.name,
      required super.studentId});
  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
      coursessId: json['-NNSrZ6lVIDSHhrLSY1S']['coursessId'],
      image: json['-NNSrZ6lVIDSHhrLSY1S']['image'],
      name: json['-NNSrZ6lVIDSHhrLSY1S']['name'],
      studentId: json['-NNSrZ6lVIDSHhrLSY1S']['id']);
}
