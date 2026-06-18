import 'package:bookly_clean_arch/core/errors/expentions.dart';
import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/core/params/book_params.dart';
import 'package:bookly_clean_arch/features/details/data/datasource/remote_data_source.dart';
import 'package:bookly_clean_arch/features/details/data/models/similar_book_model.dart';
import 'package:bookly_clean_arch/features/details/domain/repos/get_similar_books_repo.dart';
import 'package:dartz/dartz.dart';

class GetSimilarBooksRepoImpl extends GetSimilarBooksRepo {
  final DetailsRemoteDataSource detailsRemoteDataSource;

  GetSimilarBooksRepoImpl({required this.detailsRemoteDataSource});
  @override
  Future<Either<Failure, List<SimilarBookModel>>> getSimilarBooks({
    required SimilarBookParams params,
  }) async {
    try {
      final reponse = await detailsRemoteDataSource.getSimilarBooks(
        params: params,
      );
      return right(reponse);
    } on ServerException catch (e) {
      return left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
