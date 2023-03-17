abstract class BaseUsercase<T, Parameters> {
  Future<T> call(Parameters parameters);
}

class Noparameters {
  const Noparameters();
}
