import 'package:hu/core/base%20usecase/base_usecase.dart';
import 'package:hu/data/model/student_model.dart';
import 'package:hu/domain/entity/student.dart';
import 'package:hu/domain/reposetiry/base_reposetiry.dart';

class GetStudentInfoUsecase extends BaseUsercase<Student, StudentParameter> {
  final BaseReposetiry baseReposetiry;

  GetStudentInfoUsecase(this.baseReposetiry);
  @override
  Future<StudentModel> call(StudentParameter parameters) async {
    return await baseReposetiry.getStudentInformation(parameters);
  }
}

class StudentParameter {
  final String id;
  StudentParameter({required this.id});
}
