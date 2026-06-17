import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/core/widgets/use_case.dart';
import 'package:bookly_clean_arch/core/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/repos/get_books_repo.dart';
import 'package:dartz/dartz.dart';

class GetBooksUseCase extends UseCaseNoParams<List<BookEntity>> {
  final GetBooksRepo repo;

  GetBooksUseCase({required this.repo});
  @override
  Future<Either<Failure, List<BookEntity>>> call(
  ) async {
    return await repo.getBooks();
  }
}
