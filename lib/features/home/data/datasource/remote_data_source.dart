import 'package:bookly_clean_arch/constants.dart';
import 'package:bookly_clean_arch/core/database/api/api_consumer.dart';
import 'package:bookly_clean_arch/core/database/api/end_points.dart';
import 'package:bookly_clean_arch/core/functions/save_books.dart';
import 'package:bookly_clean_arch/core/models/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookModel>> getBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiConsumer api;
  HomeRemoteDataSourceImpl({required this.api});

  @override
  Future<List<BookModel>>  getBooks() async {
      final response = await api.get(
        EndPoints.searchBooks,
        quearyParams: {
          ApiKey.query: "C++",
          ApiKey.apiKey: kApiKey,
        },
      );
      final books = (response[ApiKey.books] as List)
          .expand((e) => e as List)
          .map((book) => BookModel.fromJson(book))
          .toList();
      saveBooksData(books, kNewestBox);

      return books;
  }
}
