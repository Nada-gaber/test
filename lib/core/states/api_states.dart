abstract class ApiState<T> {
  const ApiState();
  factory ApiState.initial() => Initial<T>();
  factory ApiState.loading() => Loading<T>();

  factory ApiState.success(T data) => Success<T>(data);
  factory ApiState.error(String error) => Error<T>(error);
}

class Initial<T> extends ApiState<T> {
  const Initial();
}

class Loading<T> extends ApiState<T> {
  const Loading();
}

class Success<T> extends ApiState<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends ApiState<T> {
  final String error;
  const Error(this.error);
}
