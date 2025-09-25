import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/common/helper/app_navigation.dart';
import 'package:salon_app/presentaion/auth/screens/login_screen.dart';
import 'package:salon_app/presentaion/home/screens/body_screen.dart';
import 'package:salon_app/presentaion/onboarding/screens/onboarding_screen.dart';
import 'package:salon_app/presentaion/splash/cubit/splash_cubit.dart';
import 'package:salon_app/presentaion/splash/cubit/splash_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
           if (state is UnAuthenticated) {
            AppNavigator.pushReplacement(context, OnboardingScreen());
          } 

          if (state is Authenticated) {
            AppNavigator.pushReplacement(context, BodyScreen());
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo in center
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/images/logo.png', // Make sure to add your logo image
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              
              // Loading animation at bottom
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Column(
                  children: [
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Loading...',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
