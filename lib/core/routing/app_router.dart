import 'package:flutter/material.dart';
import 'package:flutter_advanced_omar_ahmed/core/routing/routes.dart';
import 'package:flutter_advanced_omar_ahmed/features/login/ui/widgets/login_screen.dart';
import 'package:flutter_advanced_omar_ahmed/features/onboarding/onboarding_screen.dart';

class AppRouter {

Route generateRoute(RouteSettings settings){

  switch(settings.name){
    case Routes.onBoardingScreen:
    return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
    case Routes.loginScreen:
    return MaterialPageRoute(builder: (_) => const LoginScreen());

    default:
    return MaterialPageRoute(builder: (_) => Scaffold(
      body: Center(child: Text("No route defined for ${settings.name}")),
    ));

    
  }

}

}