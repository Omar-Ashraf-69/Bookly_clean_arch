import 'package:bloc/bloc.dart';
import 'package:bookly_clean_arch/core/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/home/domain/use_cases/get_books_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.getBooksUseCase}) : super(HomeInitialState());

  final GetBooksUseCase getBooksUseCase;
  Future<void> getBooks() async {
    emit(HomeInitialState());
    final response = await getBooksUseCase.call();
    response.fold(
      (error) => emit(HomeFailureState(errMessage: error.errMessage)),
      (books) => emit(HomeSuccessState(books: books)),
    );
  }
}
