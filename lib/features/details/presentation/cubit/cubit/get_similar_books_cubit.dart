import 'package:bookly_clean_arch/core/params/book_params.dart';
import 'package:bookly_clean_arch/features/details/domain/repos/get_similar_books_repo.dart';
import 'package:bookly_clean_arch/features/details/presentation/cubit/cubit/get_similar_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit({required this.repo}) : super(SimilarBooksInitial());
  final GetSimilarBooksRepo repo;

  Future<void> getSimilarBooks(int id) async {
    emit(SimilarBooksLoading());
    final response = await repo.getSimilarBooks(
      params: SimilarBookParams(id: id),
    );
    response.fold(
      (error) => emit(SimilarBooksFaileur(errorMessage: error.errMessage)),
      (success) {
        emit(SimilarBooksSuccess(similarBooks: success));
      },
    );
  }
}
