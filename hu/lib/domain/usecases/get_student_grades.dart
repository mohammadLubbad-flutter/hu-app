import 'package:hu/core/base%20usecase/base_usecase.dart';
import 'package:hu/data/model/grades_model.dart';
import 'package:hu/domain/reposetiry/base_reposetiry.dart';

class GetStudentGradesUsecase
    extends BaseUsercase<List<GradesModel>, GradesParameters> {
  final BaseReposetiry baseReposetiry;

  GetStudentGradesUsecase(this.baseReposetiry);
  @override
  Future<List<GradesModel>> call(GradesParameters parameters) async {
    return await baseReposetiry.getStudentGrades(parameters);
  }
}

class GradesParameters {
  final String id;

  GradesParameters(this.id);
}
