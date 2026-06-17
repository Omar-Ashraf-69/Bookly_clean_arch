import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/core/params/book_params.dart';
import 'package:bookly_clean_arch/core/widgets/use_case.dart';
import 'package:bookly_clean_arch/core/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/search/domain/repos/search_books_repo.dart';
import 'package:dartz/dartz.dart';

class SearchBooksUseCase extends UseCase<List<BookEntity>, BookParams> {
  final SearchBooksRepo repo;

  SearchBooksUseCase({required this.repo});

  @override
  Future<Either<Failure, List<BookEntity>>> call(BookParams params) async {
    return await repo.searchBooks(params: params);
  }
}
