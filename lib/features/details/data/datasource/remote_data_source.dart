import 'package:bookly_clean_arch/constants.dart';
import 'package:bookly_clean_arch/core/database/api/api_consumer.dart';
import 'package:bookly_clean_arch/core/database/api/end_points.dart';
import 'package:bookly_clean_arch/core/errors/expentions.dart';
import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/core/params/book_params.dart';
import 'package:bookly_clean_arch/features/details/data/models/similar_book_model.dart';
import 'package:dartz/dartz.dart';

abstract class DetailsRemoteDataSource {
  Future<Either<Failure, List<SimilarBookModel>>> getSimilarBooks({
    required SimilarBookParams params,
  });
}

class DetailsRemoteDataSourceImpl extends DetailsRemoteDataSource {
  final ApiConsumer api;

  DetailsRemoteDataSourceImpl({required this.api});

  @override
  Future<Either<Failure, List<SimilarBookModel>>> getSimilarBooks({
    required SimilarBookParams params,
  }) async {
    try {
      final response = await api.get(
        EndPoints.similarBooks(params.id),
        quearyParams: {ApiKey.apiKey: kApiKey, ApiKey.number: 15},
      );
      final List data = response[ApiKey.similarBooks];

      final books = data.map((e) => SimilarBookModel.fromJson(e)).toList();
      return right(books);
    } on ServerException catch (e) {
      return left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
