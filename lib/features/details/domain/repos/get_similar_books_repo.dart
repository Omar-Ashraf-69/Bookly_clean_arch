import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/core/params/book_params.dart';
import 'package:bookly_clean_arch/features/details/data/models/similar_book_model.dart';
import 'package:dartz/dartz.dart';

abstract class GetSimilarBooksRepo {
  Future<Either<Failure,List<SimilarBookModel>>> getSimilarBooks({SimilarBookParams params});
}