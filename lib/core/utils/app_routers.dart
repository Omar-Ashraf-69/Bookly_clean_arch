import 'package:bookly_clean_arch/core/database/api/dio_consumer.dart';
import 'package:bookly_clean_arch/core/entities/book_entity.dart';
import 'package:bookly_clean_arch/features/details/data/datasource/remote_data_source.dart';
import 'package:bookly_clean_arch/features/details/data/repos/get_similar_books_repo_impl.dart';
import 'package:bookly_clean_arch/features/details/presentation/cubit/cubit/get_similar_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/data/datasource/local_data_source.dart';
import 'package:bookly_clean_arch/features/home/data/datasource/remote_data_source.dart';
import 'package:bookly_clean_arch/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_clean_arch/features/home/domain/use_cases/get_books_use_case.dart';
import 'package:bookly_clean_arch/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookly_clean_arch/features/search/data/datasource/remote_data_source.dart';
import 'package:bookly_clean_arch/features/search/data/repos/search_books_repo_impl.dart';
import 'package:bookly_clean_arch/features/search/presentation/cubit/search_cubit.dart';
import 'package:bookly_clean_arch/features/search/presentation/view/search_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/presentation/views/home_view.dart';
import '../../features/details/presentation/views/details_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouters {
  static const kHomeView = '/homeView';
  static const kDetailsView = '/DetailsView';
  static const kSearchView = '/SearchView';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(
            getBooksUseCase: GetBooksUseCase(
              repo: GetBooksRepoImpl(
                homeLocalDataSource: HomeLocalDataSourceImpl(),
                homeRemoteDataSource: HomeRemoteDataSourceImpl(
                  api: DioConsumer(dio: Dio()),
                ),
              ),
            ),
          )..getBooks(),
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: kDetailsView,
        builder: (context, state) {
          final book = state.extra as BookEntity;
          return BlocProvider(
            create: (context) => SimilarBooksCubit(
              repo: GetSimilarBooksRepoImpl(
                detailsRemoteDataSource: DetailsRemoteDataSourceImpl(
                  api: DioConsumer(dio: Dio()),
                ),
              ),
            ),
            child: DetailsView(book: book),
          );
        },
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(
            repo: SearchBooksRepoImpl(
              searchRemoteDataSource: SearchRemoteDataSourceImpl(
                api: DioConsumer(dio: Dio()),
              ),
            ),
          ),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
