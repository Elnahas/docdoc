import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_omar_ahmed/core/di/dependency_injection.dart';
import 'package:flutter_advanced_omar_ahmed/core/routing/app_router.dart';
import 'package:flutter_advanced_omar_ahmed/doc_app.dart';

void main() {
  
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.red, // navigation bar color
    statusBarColor: Colors.pink, // status bar color
  ));
  setupGetIt();
  runApp( DocApp(appRouter: AppRouter(),));
}