import 'package:hu/data/model/grades_model.dart';
import 'package:hu/domain/entity/grades.dart';
import 'package:hu/domain/usecases/authintication_usecase.dart';
import 'package:hu/domain/usecases/get_course_info_usecase.dart';
import 'package:hu/domain/usecases/get_student_grades.dart';
import 'package:hu/domain/usecases/get_student_info_usecase.dart';

import '../../data/model/course_model.dart';
import '../../data/model/event_model.dart';
import '../../data/model/student_model.dart';
import '../usecases/get_events_usecase.dart';

abstract class BaseReposetiry {
  Future<StudentModel> getStudentInformation(StudentParameter parameter);
  Future<List<CourseModel>> getCoursesInformation(CourseParameter parameter);
  Future<List<GradesModel>> getStudentGrades(GradesParameters parameters);
  Future<bool> auhtinticated(AuthParameters parameters);
  Future<List<EventModel>> getEvents(EventParameters parameters);
}
