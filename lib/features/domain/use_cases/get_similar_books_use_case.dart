import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/core/params/book_params.dart';
import 'package:bookly_clean_arch/core/widgets/use_case.dart';
import 'package:bookly_clean_arch/features/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/domain/repos/get_similar_books_repo.dart';
import 'package:dartz/dartz.dart';

class GetSimilarBooksUseCase
    extends UseCase<List<BookEntity>, SimilarBookParams> {
  final GetSimilarBooksRepo repo;

  GetSimilarBooksUseCase({required this.repo});
  @override
  Future<Either<Failure, List<BookEntity>>> call(params)async {
    return await repo.getSimilarBooks(params: params);
  }
}
