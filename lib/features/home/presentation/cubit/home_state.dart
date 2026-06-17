part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {
  final List<BookEntity> books;

  HomeSuccessState({required this.books});
}

final class HomeFailureState extends HomeState {
  final String errMessage;

  HomeFailureState({required this.errMessage});
}
