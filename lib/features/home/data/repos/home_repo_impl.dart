import 'dart:developer';

import 'package:bookly_clean_arch/core/entities/book_entity.dart';
import 'package:bookly_clean_arch/core/errors/expentions.dart';
import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:bookly_clean_arch/features/home/data/datasource/local_data_source.dart';
import 'package:bookly_clean_arch/features/home/data/datasource/remote_data_source.dart';
import 'package:bookly_clean_arch/features/home/domain/repos/get_books_repo.dart';
import 'package:dartz/dartz.dart';

class GetBooksRepoImpl extends GetBooksRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  GetBooksRepoImpl({
    required this.homeLocalDataSource,
    required this.homeRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> getBooks() async {
    List<BookEntity> booksList;
    try {
      booksList = homeLocalDataSource.getBooks();
      if (booksList.isNotEmpty) {
        log("It's the local data source ");
        return right(booksList);
      }
      booksList = await homeRemoteDataSource.getBooks();
      return right(booksList);
    } on ServerException catch (e) {
      return left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
