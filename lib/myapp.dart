import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/core/config/themes/app_theme.dart';
import 'package:salon_app/domain/theme_entity.dart';
import 'package:salon_app/presentaion/auth/screens/create_new_password.dart';
import 'package:salon_app/presentaion/auth/screens/fill_profile.dart';
import 'package:salon_app/presentaion/auth/screens/forget_password_screen.dart';
import 'package:salon_app/presentaion/home/screens/body_screen.dart';
import 'package:salon_app/presentaion/home/screens/home_screen.dart';
import 'package:salon_app/presentaion/profile/screens/profile_screen.dart';
import 'package:salon_app/presentaion/splash/cubit/splash_cubit.dart';
import 'package:salon_app/presentaion/splash/screens/splash_screen.dart';
import 'package:salon_app/presentaion/theme/cubit/theme_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(
          create: (_) => SplashCubit()..appstarted(),
        ),
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, AppThemeMode>(
        builder: (_, state) {
          return AnimatedTheme(
            data: state == AppThemeMode.dark
                ? AppTheme.darkTheme
                : AppTheme.lightTheme,
            duration: const Duration(milliseconds: 300),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Salon app',
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: state == AppThemeMode.dark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: const BodyScreen(),
            ),
          );
        },
      ),
    );
  }
}
