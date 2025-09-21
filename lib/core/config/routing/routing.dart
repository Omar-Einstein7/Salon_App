// import 'package:flutter/material.dart';
// import 'package:salon_app/presentaion/auth/screens/login_screen.dart';
// import 'package:salon_app/presentaion/auth/screens/signup_screen.dart';
// import 'package:salon_app/presentaion/home/screens/booking_screen.dart';
// import 'package:salon_app/presentaion/home/screens/home_screen.dart';
// import 'package:salon_app/presentaion/home/screens/profile_screen.dart';
// import 'package:salon_app/presentaion/splash/screens/splash_screen.dart';

// class AppRouter {
//   static const String initial = '/';
//   static const String login = '/login';
//   static const String register = '/register';
//   static const String home = '/home';
//   static const String profile = '/profile';
//   static const String appointments = '/appointments';
//   static const String services = '/services';
//   static const String serviceDetails = '/service-details';
//   static const String booking = '/booking';

//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case initial:
//         return MaterialPageRoute(builder: (_) => const SplashScreen());
      
//       case login:
//         return MaterialPageRoute(builder: (_) => const LoginScreen());
      
//       case register:
//         return MaterialPageRoute(builder: (_) => const SignupScreen());
      
//       case home:
//         return MaterialPageRoute(builder: (_) => const HomeScreen());
      
//       case profile:
//         return MaterialPageRoute(builder: (_) => const ProfileScreen());
      
//       case appointments:
//         return MaterialPageRoute(builder: (_) => const BookingScreen());
      
//       case services:
//         return MaterialPageRoute(builder: (_) => const ServicesScreen());
      
//       case serviceDetails:
//         final args = settings.arguments as Map<String, dynamic>?;
//         final serviceId = args?['id'] as String? ?? '';
//         return MaterialPageRoute(
//           builder: (_) => ServiceDetailsScreen(serviceId: serviceId),
//         );
      
//       case booking:
//         final args = settings.arguments as Map<String, dynamic>?;
//         final serviceId = args?['serviceId'] as String? ?? '';
//         return MaterialPageRoute(
//           builder: (_) => BookingScreen(serviceId: serviceId),
//         );
      
//       default:
//         return MaterialPageRoute(
//           builder: (_) => const ErrorScreen(),
//         );
//     }
//   }

//   static void navigateTo(BuildContext context, String routeName, {Object? arguments}) {
//     Navigator.pushNamed(context, routeName, arguments: arguments);
//   }

//   static void navigateAndReplace(BuildContext context, String routeName, {Object? arguments}) {
//     Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
//   }

//   static void navigateAndRemoveUntil(BuildContext context, String routeName, {Object? arguments}) {
//     Navigator.pushNamedAndRemoveUntil(
//       context, 
//       routeName,
//       (Route<dynamic> route) => false,
//       arguments: arguments,
//     );
//   }

//   static void pop(BuildContext context) {
//     Navigator.pop(context);
//   }
// }
