import 'package:hu/core/base%20usecase/base_usecase.dart';
import 'package:hu/data/model/course_model.dart';
import 'package:hu/domain/entity/course.dart';
import 'package:hu/domain/reposetiry/base_reposetiry.dart';

class GetCourseInfoUsecase
    extends BaseUsercase<List<CourseModel>, CourseParameter> {
  final BaseReposetiry baseReposetiry;

  GetCourseInfoUsecase(this.baseReposetiry);
  @override
  Future<List<CourseModel>> call(CourseParameter parameters) async {
    return await baseReposetiry.getCoursesInformation(parameters);
  }
}

class CourseParameter {
  final List coursessnumber;

  CourseParameter({required this.coursessnumber});
}
