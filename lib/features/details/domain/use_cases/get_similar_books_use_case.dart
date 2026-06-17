import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/core/params/book_params.dart';
import 'package:bookly_clean_arch/core/widgets/use_case.dart';
import 'package:bookly_clean_arch/features/details/data/models/similar_book_model.dart';
import 'package:bookly_clean_arch/features/details/domain/repos/get_similar_books_repo.dart';
import 'package:dartz/dartz.dart';

class GetSimilarBooksUseCase
    extends UseCase<List<SimilarBookModel>, SimilarBookParams> {
  final GetSimilarBooksRepo repo;

  GetSimilarBooksUseCase({required this.repo});
  @override
  Future<Either<Failure, List<SimilarBookModel>>> call(params)async {
    return await repo.getSimilarBooks(params: params);
  }
}
