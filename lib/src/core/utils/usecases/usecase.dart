import 'package:flutter_clean_architecture/src/core/utils/typedef/typedef.dart';

/// For Use case that takes Params
abstract class UseCaseWithParams<T, Params> {
  const UseCaseWithParams();

  ResultFuture<T> call(Params params);
}

/// For Use case that does not have params
abstract class UseCaseWithoutParams<T>{
  const UseCaseWithoutParams();

  ResultFuture<T> call();
}
