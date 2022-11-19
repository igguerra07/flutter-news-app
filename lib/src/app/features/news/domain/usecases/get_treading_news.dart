import 'package:newsapp/src/app/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:newsapp/src/app/features/news/domain/entities/news_resource.dart';
import 'package:newsapp/src/app/features/news/domain/repositories/news_repository.dart';
import 'package:newsapp/src/app/features/news/domain/usecases/nothing.dart';
import 'package:newsapp/src/app/features/news/domain/usecases/use_case.dart';

class GetTreadingNews implements UseCase<Nothing, NewsResource> {
  late final NewsRepository _newsRepository;

  GetTreadingNews({
    required NewsRepository newsRepository,
  }) {
    _newsRepository = newsRepository;
  }

  @override
  Future<Either<Failure, NewsResource>> call(Nothing params) {
    return _newsRepository.getTreadingNews();
  }
}
