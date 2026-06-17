import 'package:bookly_clean_arch/constants.dart';
import 'package:bookly_clean_arch/core/database/api/api_consumer.dart';
import 'package:bookly_clean_arch/core/database/api/end_points.dart';
import 'package:bookly_clean_arch/core/errors/expentions.dart';
import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/core/params/book_params.dart';
import 'package:bookly_clean_arch/core/models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRemoteDataSource {
  Future<Either<Failure, List<BookModel>>> searchBooks({
    required BookParams params,
  });
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiConsumer api;
  SearchRemoteDataSourceImpl({required this.api});

  @override
  Future<Either<Failure, List<BookModel>>> searchBooks({
    required BookParams params,
  }) async {
    try {
      final response = await api.get(
        EndPoints.searchBooks,
        quearyParams: {
          ApiKey.number: 30,
          ApiKey.apiKey: kApiKey,
          ApiKey.query: params.query,
        },
      );
      final books = (response[ApiKey.books] as List)
          .expand((e) => e as List)
          .map((book) => BookModel.fromJson(book))
          .toList();
      return right(books);
    } on ServerException catch (e) {
      return left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
