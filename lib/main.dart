import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:salon_app/myapp.dart';
import 'package:salon_app/service_locator.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  await GetIt.instance.allReady(); // Ensure all async singletons are ready
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}
