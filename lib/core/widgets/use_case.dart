import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase< type,Params> {
  Future<Either<Failure,type>> call(Params params);
}

abstract class UseCaseNoParams<type> {
  Future<Either<Failure, type>> call();
}