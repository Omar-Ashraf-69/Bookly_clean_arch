import 'package:bookly_clean_arch/constants.dart';
import 'package:bookly_clean_arch/core/database/api/api_consumer.dart';
import 'package:bookly_clean_arch/core/database/api/end_points.dart';
import 'package:bookly_clean_arch/core/errors/expentions.dart';
import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/core/functions/save_books.dart';
import 'package:bookly_clean_arch/core/models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure, List<BookModel>>> getBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiConsumer api;
  HomeRemoteDataSourceImpl({required this.api});

  @override
  Future<Either<Failure, List<BookModel>>> getBooks() async {
    try {
      final response = await api.get(
        EndPoints.searchBooks,
        quearyParams: {
          ApiKey.query: "programming",
          ApiKey.number: 15,
          ApiKey.apiKey: kApiKey,
        },
      );
      final books = (response[ApiKey.books] as List)
          .expand((e) => e as List)
          .map((book) => BookModel.fromJson(book))
          .toList();
      saveBooksData(books, kNewestBox);

      return right(books);
    } on ServerException catch (e) {
      return left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
