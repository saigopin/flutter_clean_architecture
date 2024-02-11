import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/src/core/errors/failures.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}
class NoParams{
  
}
