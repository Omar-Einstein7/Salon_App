import 'package:get_it/get_it.dart';
import 'package:salon_app/core/network/dio_clint.dart';
import 'package:salon_app/data/auth/repo_impl/auth.dart';

import 'package:salon_app/data/auth/sources/auth_api_source.dart';
import 'package:salon_app/data/local_theme_datasource.dart';
import 'package:salon_app/data/theme_repository_impl.dart';

import 'package:salon_app/domain/auth/repo/auth.dart';

import 'package:salon_app/domain/auth/usecases/is_logged_in.dart';
import 'package:salon_app/domain/auth/usecases/logout_usecase.dart';
import 'package:salon_app/domain/auth/usecases/signup.dart';
import 'package:salon_app/domain/get_theme_mode.dart';
import 'package:salon_app/domain/set_theme_mode.dart';
import 'package:salon_app/domain/theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'domain/auth/usecases/signin.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Initialize core services first
  sl.registerSingletonAsync<SharedPreferences>(() => SharedPreferences.getInstance());
  sl.registerLazySingleton<DioClient>(() => DioClient());

  // Register services
  sl.registerLazySingleton<AuthService>(() => AuthApiServiceImpl());
  
  // Register repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  // Register use cases lazily
  sl.registerLazySingleton<SignupUseCase>(() => SignupUseCase());
  sl.registerLazySingleton<SigninUseCase>(() => SigninUseCase());
  sl.registerLazySingleton<IsLoggedInUseCase>(() => IsLoggedInUseCase());
  sl.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase());
  // sl.registerSingleton<GetTrandingMoviesUseCases>(GetTrandingMoviesUseCases());
  // sl.registerSingleton<GetNowPlayingMoviesUseCase>(
  //     GetNowPlayingMoviesUseCase());
//   sl.registerSingleton<GetPopularTvUseCase>(GetPopularTvUseCase());
//   sl.registerSingleton<GetMovieTrailerUseCase>(GetMovieTrailerUseCase());
//   sl.registerSingleton<GetReommendationMovieUseCase>(
//       GetReommendationMovieUseCase());
//   sl.registerSingleton<GetSimilarMoviesUseCase>(GetSimilarMoviesUseCase());
//   sl.registerSingleton<GetSimilarTvsUseCase>(GetSimilarTvsUseCase());
//   sl.registerSingleton<GetRecommendationsTvsUseCase>(
//       GetRecommendationsTvsUseCase());
//   sl.registerSingleton<GetTVKeywordsUseCase>(GetTVKeywordsUseCase());

//   sl.registerSingleton<SearchMoviesUsecase>(SearchMoviesUsecase());
//   sl.registerSingleton<SearchTvUsecase>(SearchTvUsecase());



// Theme related registrations
sl.registerLazySingleton<ThemeRepository>(() => ThemeRepositoryImpl());
sl.registerLazySingleton<LocalThemeDataSource>(() => LocalThemeDataSourceImpl());
sl.registerLazySingleton<SetThemeMode>(() => SetThemeMode());
sl.registerLazySingleton<GetThemeMode>(() => GetThemeMode());


}
