import 'package:hu/core/base%20usecase/base_usecase.dart';
import 'package:hu/domain/reposetiry/base_reposetiry.dart';

class AuthinticationUseCase extends BaseUsercase<bool, AuthParameters> {
  final BaseReposetiry baseReposetiry;
  AuthinticationUseCase(this.baseReposetiry);

  @override
  Future<bool> call(AuthParameters parameters) async {
    return await baseReposetiry.auhtinticated(parameters);
  }
}

class AuthParameters {
  final String email;
  final String password;

  AuthParameters(this.email, this.password);
}
