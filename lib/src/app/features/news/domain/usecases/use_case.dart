import 'package:dartz/dartz.dart';
import 'package:newsapp/src/app/errors/failures.dart';

abstract class UseCase<P, T> {
  Future<Either<Failure, T>> call(P params);
}