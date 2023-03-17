import 'package:hu/domain/usecases/get_student_info_usecase.dart';

class AppConstants {
  static String baseUrl = 'https://hu-stu-app-default-rtdb.firebaseio.com';
  static String apiKey = 'AIzaSyBW8easMtmGO0zqNxetSoRY5KLRCEVxPFE';
  static String authenticationUrl =
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$apiKey';

  static String getStudentInfoPath(StudentParameter parameter) {
    String filter = 'orderBy="id"&equalTo="${parameter.id}"';
    return '$baseUrl/Students.json?$filter';
  }

  static String getCourseInfoPath(String id) {
    return '$baseUrl/Course/-NNT0io6XvOO9ZQB0r_Y/$id.json';
  }

  static String getStudentGradesPath(String id) {
    return '$baseUrl/Grades/$id.json';
  }

  static String getEventsPath(String courseid) {
    return '$baseUrl/Dates/$courseid.json';
  }
}
