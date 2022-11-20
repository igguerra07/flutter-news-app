import 'package:dartz/dartz.dart';
import 'package:newsapp/src/app/errors/failures.dart';
import 'package:newsapp/src/app/features/news/domain/entities/news_resource.dart';

abstract class NewsRepository {
  Future<Either<Failure, NewsResource>> getTreadingNews();
  Future<Either<Failure, NewsResource>> getNewsByCategory({
    required String category,
  });
}
