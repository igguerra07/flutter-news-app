import 'package:dartz/dartz.dart';
import 'package:newsapp/src/app/errors/failures.dart';
import 'package:newsapp/src/app/features/news/domain/entities/news_resource.dart';
import 'package:newsapp/src/app/features/news/domain/repositories/news_repository.dart';
import 'package:newsapp/src/app/features/news/domain/usecases/use_case.dart';

class GetNewsByCategory
    implements UseCase<GetNewsByCategoryParams, NewsResource> {
  late final NewsRepository _newsRepository;

  GetNewsByCategory({
    required NewsRepository newsRepository,
  }) {
    _newsRepository = newsRepository;
  }

  @override
  Future<Either<Failure, NewsResource>> call(GetNewsByCategoryParams params) {
    return _newsRepository.getNewsByCategory(category: params.category);
  }
}

class GetNewsByCategoryParams {
  final String category;

  GetNewsByCategoryParams({
    required this.category,
  });
}
