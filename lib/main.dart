import 'dart:io';

import 'package:flutter/material.dart';
import 'package:salon_app/myapp.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
Future<void> main() async {
    HttpOverrides.global =  MyHttpOverrides();
  runApp(const MyApp());
}
