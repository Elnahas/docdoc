import 'package:flutter/material.dart';
import 'package:flutter_advanced_omar_ahmed/core/helpers/extentions.dart';
import 'package:flutter_advanced_omar_ahmed/core/routing/routes.dart';
import 'package:flutter_advanced_omar_ahmed/core/theming/colors.dart';
import 'package:flutter_advanced_omar_ahmed/core/theming/styles.dart';
import 'package:flutter_advanced_omar_ahmed/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced_omar_ahmed/features/auth/login/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Error || current is Success,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: CircularProgressIndicator(
                        color: ColorsManager.mainBlue),
                  );
                });
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: Icon(
              Icons.error,
              color: Colors.red,
              size: 32,
            ),
            content:
                Text(error, style: TextStyles.font15DarkBlueMedium),
            actions: [
              TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    "Got it",
                    style: TextStyles.font14BlueSemiBold,
                  ))
            ],
          );
        });
  }
}
