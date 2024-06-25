import 'package:flutter/material.dart';
import 'package:flutter_advanced_omar_ahmed/core/di/dependency_injection.dart';
import 'package:flutter_advanced_omar_ahmed/core/routing/routes.dart';
import 'package:flutter_advanced_omar_ahmed/features/auth/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/logic/home_cubit.dart';
import 'package:flutter_advanced_omar_ahmed/features/home/ui/screens/home_screen.dart';
import 'package:flutter_advanced_omar_ahmed/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced_omar_ahmed/features/auth/login/ui/widgets/login_screen.dart';
import 'package:flutter_advanced_omar_ahmed/features/onboarding/onboarding_screen.dart';
import 'package:flutter_advanced_omar_ahmed/features/auth/sign_up/ui/widgets/signup_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => HomeCubit(getit())..getSpecializations(),
                  child: const HomeScreen(),
                ));
      case Routes.signupScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getit<SignupCubit>(),
                  child: const SignupScreen(),
                ));
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getit<LoginCubit>(),
                  child: const LoginScreen(),
                ));

      default:
        return null;
    }
  }
}
