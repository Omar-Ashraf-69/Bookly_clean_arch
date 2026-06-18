

import 'package:bookly_clean_arch/features/details/data/models/similar_book_model.dart';

sealed class SimilarBooksState {}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksSuccess extends SimilarBooksState {
  final   List<SimilarBookModel> similarBooks;

  SimilarBooksSuccess({required this.similarBooks});

}

final class SimilarBooksFaileur extends SimilarBooksState {
  final String errorMessage;

  SimilarBooksFaileur({required this.errorMessage});

}
