import 'package:get_it/get_it.dart';
import 'package:salon_app/core/network/dio_clint.dart';
import 'package:salon_app/data/auth/repo_impl/auth.dart';

import 'package:salon_app/data/auth/sources/auth_api_source.dart';

import 'package:salon_app/domain/auth/repo/auth.dart';

import 'package:salon_app/domain/auth/usecases/is_logged_in.dart';
import 'package:salon_app/domain/auth/usecases/logout_usecase.dart';
import 'package:salon_app/domain/auth/usecases/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'domain/auth/usecases/signin.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);
  
  sl.registerSingleton<DioClient>(DioClient());

  //Services
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());

                                                                                                              
  //Repo
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  //Usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<LogoutUseCase>(LogoutUseCase());
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
}
