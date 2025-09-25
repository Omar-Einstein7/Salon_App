

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/domain/auth/usecases/is_logged_in.dart';
import 'package:salon_app/presentaion/splash/cubit/splash_state.dart';
import 'package:salon_app/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appstarted() async {
     await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(
        UnAuthenticated()
      );
    }
  }
}
