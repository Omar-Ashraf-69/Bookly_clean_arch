import 'package:bookly_clean_arch/core/entities/book_entity.dart';
import 'package:bookly_clean_arch/core/errors/expentions.dart';
import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/core/params/book_params.dart';
import 'package:bookly_clean_arch/features/search/data/datasource/remote_data_source.dart';
import 'package:bookly_clean_arch/features/search/domain/repos/search_books_repo.dart';
import 'package:dartz/dartz.dart';

class SearchBooksRepoImpl extends SearchBooksRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchBooksRepoImpl({required this.searchRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> searchBooks({
    required BookParams params,
  }) async {
    try {
      final response = await searchRemoteDataSource.searchBooks(params: params);
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
