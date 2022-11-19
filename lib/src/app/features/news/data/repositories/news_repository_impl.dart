import 'package:newsapp/src/app/features/news/data/datasources/remote/news_remote_data.dart';
import 'package:newsapp/src/app/features/news/data/mappers/news_resource_mapper.dart';
import 'package:newsapp/src/app/features/news/domain/entities/news_resource.dart';
import 'package:newsapp/src/app/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:newsapp/src/app/features/news/domain/repositories/news_repository.dart';
import 'package:newsapp/src/infra/network/api_exception.dart';

class NewsRepositoryImpl implements NewsRepository {
  late final NewsRemoteDataSource _remote;

  NewsRepositoryImpl({
    required NewsRemoteDataSource remote,
  }) {
    _remote = remote;
  }

  @override
  Future<Either<Failure, NewsResource>> getTreadingNews() async {
    try {
      final data = await _remote.getTreadingNews();
      final news = data.toEntity();
      return right(news);
    } on ApiException catch (e) {
      switch (e.type) {
        case ApiErrorType.other:
          return left(AppFailure());
        case ApiErrorType.connection:
          return left(ConnectionFailure());
        case ApiErrorType.response:
          switch (e.statusCode) {
            case 401:
              return left(NotAuthorizedFailure());
            case 404:
              return left(NotFoundFailure());
            case 500:
              return left(InternalServeFailure());
          }
          return left(ResponseFailure());
      }
    }
  }
}
