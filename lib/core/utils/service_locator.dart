import 'package:bookly_clean_arch/core/database/api/dio_consumer.dart';
import 'package:bookly_clean_arch/features/details/data/datasource/remote_data_source.dart';
import 'package:bookly_clean_arch/features/details/data/repos/get_similar_books_repo_impl.dart';
import 'package:bookly_clean_arch/features/details/domain/repos/get_similar_books_repo.dart';
import 'package:bookly_clean_arch/features/details/presentation/cubit/cubit/get_similar_books_cubit.dart';
import 'package:bookly_clean_arch/features/home/data/datasource/local_data_source.dart';
import 'package:bookly_clean_arch/features/home/data/datasource/remote_data_source.dart';
import 'package:bookly_clean_arch/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_clean_arch/features/home/domain/repos/get_books_repo.dart';
import 'package:bookly_clean_arch/features/home/domain/use_cases/get_books_use_case.dart';
import 'package:bookly_clean_arch/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookly_clean_arch/features/search/data/datasource/remote_data_source.dart';
import 'package:bookly_clean_arch/features/search/data/repos/search_books_repo_impl.dart';
import 'package:bookly_clean_arch/features/search/domain/repos/search_books_repo.dart';
import 'package:bookly_clean_arch/features/search/presentation/cubit/search_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: getIt<Dio>()));





  //! Home Feature
  getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(),
  );
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(api: getIt<DioConsumer>()),
  );
  getIt.registerLazySingleton<GetBooksRepo>(
    () => GetBooksRepoImpl(
      homeLocalDataSource: getIt<HomeLocalDataSource>(),
      homeRemoteDataSource: getIt<HomeRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<GetBooksUseCase>(
    () => GetBooksUseCase(repo: getIt<GetBooksRepo>()),
  );
  getIt.registerSingleton<HomeCubit>(
    HomeCubit(getBooksUseCase: getIt<GetBooksUseCase>()),
  );


  //! Details Feature
  getIt.registerSingleton<DetailsRemoteDataSource>(
    DetailsRemoteDataSourceImpl(api: getIt<DioConsumer>()),
  );
  getIt.registerLazySingleton<GetSimilarBooksRepo>(
    () => GetSimilarBooksRepoImpl(
      detailsRemoteDataSource: getIt<DetailsRemoteDataSource>(),
    ),
  );

  getIt.registerFactory<SimilarBooksCubit>(
    () => SimilarBooksCubit(repo: getIt<GetSimilarBooksRepo>()),
  );


  //! Search Feature
  getIt.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(api: getIt<DioConsumer>()),
  );
  getIt.registerLazySingleton<SearchBooksRepo>(
    () => SearchBooksRepoImpl(
      searchRemoteDataSource: getIt<SearchRemoteDataSource>(),
    ),
  );
  getIt.registerFactory<SearchCubit>(
    () => SearchCubit(repo: getIt<SearchBooksRepo>()),
  );
}
