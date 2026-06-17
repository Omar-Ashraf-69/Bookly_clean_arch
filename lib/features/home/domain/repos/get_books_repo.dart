import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/core/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GetBooksRepo {
  Future<Either<Failure, List<BookEntity>>> getBooks();
}
