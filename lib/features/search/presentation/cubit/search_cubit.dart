import 'package:bookly_clean_arch/core/entities/book_entity.dart';
import 'package:bookly_clean_arch/core/params/book_params.dart';
import 'package:bookly_clean_arch/features/search/domain/repos/search_books_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchBooksRepo repo;

  SearchCubit({required this.repo}) : super(SearchInitial());
  final TextEditingController searchText = TextEditingController();

  Future<void> searchBooks() async {
    emit(SearchLoading());
    final response = await repo.searchBooks( params: BookParams(query: searchText.text));
    response.fold((error) => emit(SearchFaileur(errorMessage: error.errMessage)), (
      success,
    ) {
      emit(SearchSuccess(books: success));
    });
  }
}
