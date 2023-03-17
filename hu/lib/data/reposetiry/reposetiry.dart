import 'package:flutter/cupertino.dart';
import 'package:hu/data/data%20source/data_source.dart';
import 'package:hu/data/model/event_model.dart';
import 'package:hu/data/model/grades_model.dart';
import 'package:hu/data/model/student_model.dart';
import 'package:hu/data/model/course_model.dart';
import 'package:hu/domain/reposetiry/base_reposetiry.dart';
import 'package:hu/domain/usecases/authintication_usecase.dart';
import 'package:hu/domain/usecases/get_events_usecase.dart';
import 'package:hu/domain/usecases/get_student_grades.dart';
import 'package:hu/domain/usecases/get_student_info_usecase.dart';
import 'package:hu/domain/usecases/get_course_info_usecase.dart';

class Reposetiry extends BaseReposetiry {
  final BaseDataSource baseDataSource;

  Reposetiry(this.baseDataSource);
  @override
  Future<List<CourseModel>> getCoursesInformation(
      CourseParameter parameter) async {
    return await baseDataSource.getCourseInfo(parameter);
  }

  @override
  Future<StudentModel> getStudentInformation(StudentParameter parameter) async {
    return await baseDataSource.getStudentInfo(parameter);
  }

  @override
  Future<List<GradesModel>> getStudentGrades(
      GradesParameters parameters) async {
    return await baseDataSource.getStudentGrades(parameters);
  }

  @override
  Future<bool> auhtinticated(AuthParameters parameters) async {
    return await baseDataSource.authinticated(parameters);
  }

  @override
  Future<List<EventModel>> getEvents(EventParameters parameters) async {
    return await baseDataSource.getEvents(parameters);
  }
}
