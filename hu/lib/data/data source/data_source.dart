import 'dart:convert';
import 'dart:io';

import 'package:hu/data/model/course_model.dart';
import 'package:hu/data/model/grades_model.dart';
import 'package:hu/data/model/student_model.dart';
import 'package:http/http.dart' as http;
import 'package:hu/domain/usecases/authintication_usecase.dart';
import 'package:hu/domain/usecases/get_course_info_usecase.dart';
import 'package:hu/domain/usecases/get_student_grades.dart';
import 'package:hu/domain/usecases/get_student_info_usecase.dart';

import '../../core/utils/app_constants.dart';
import '../../domain/usecases/get_events_usecase.dart';
import '../model/event_model.dart';

abstract class BaseDataSource {
  Future<StudentModel> getStudentInfo(StudentParameter parameter);
  Future<List<CourseModel>> getCourseInfo(CourseParameter parameter);
  Future<List<GradesModel>> getStudentGrades(GradesParameters parameters);
  Future<bool> authinticated(AuthParameters parameters);
  Future<List<EventModel>> getEvents(EventParameters parameters);
}

class DataSource extends BaseDataSource {
  @override
  Future<List<CourseModel>> getCourseInfo(CourseParameter parameter) async {
    try {
      final List<CourseModel> coursess = [];

      for (var element in parameter.coursessnumber) {
        final res = await http
            .get(Uri.parse(AppConstants.getCourseInfoPath(element.toString())));

        final response = jsonDecode(res.body) as Map;

        response.forEach((k, data) {
          coursess.add(CourseModel.fromJson(data));
        });
      }

      //print(coursess[4]);
      print(coursess);
      return coursess;
    } catch (e) {
      print('rrrrrrrrrrrrrrrrrrrrrrrrr$e');
      rethrow;
    }
  }

  @override
  Future<StudentModel> getStudentInfo(StudentParameter parameter) async {
    print('gggggggggggggggggggggggggggggggggggg');
    try {
      final res =
          await http.get(Uri.parse(AppConstants.getStudentInfoPath(parameter)));
      final response = jsonDecode(res.body);
      print(';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;');
      print(response);

      return StudentModel.fromJson(response);
    } catch (e) {
      print('rrrrrrrrrrrrrrrrrrrrrrrrr$e');
      rethrow;
    }
  }

  @override
  Future<List<GradesModel>> getStudentGrades(
      GradesParameters parameters) async {
    try {
      final res = await http
          .get(Uri.parse(AppConstants.getStudentGradesPath(parameters.id)));
      final response = jsonDecode(res.body) as Map;
      // print(response);
      final List<GradesModel> grades = [];
      response.forEach((key, data) {
        for (var element in data) {
          //print(element);
          grades.add(GradesModel.fromJson(element));
        }
      });
      return grades;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> authinticated(AuthParameters parameters) async {
    final res = await http.post(Uri.parse(AppConstants.authenticationUrl),
        body: jsonEncode({
          'email': parameters.email,
          'password': parameters.password,
          'returnSecureToken': true,
        }));
    return res.statusCode == 200 ? true : false;
  }

  @override
  Future<List<EventModel>> getEvents(EventParameters parameters) async {
    List<EventModel> events = [];
    try {
      for (var i = 0; i < parameters.courseid.length; i++) {
        final res = await http.get(Uri.parse(
            AppConstants.getEventsPath(parameters.courseid[i].toString())));
        final response = jsonDecode(res.body);
        response.forEach((key, data) {
          events.add(EventModel.fromJson(data));
        });
      }
      print(events);
      return events;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
