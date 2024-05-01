import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_omar_ahmed/core/helpers/extentions.dart';
import 'package:flutter_advanced_omar_ahmed/core/routing/routes.dart';

import '../../../../../core/theming/styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {

    final TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer()
  ..onTap = (){

    context.pushNamed(Routes.signupScreen);

  };
  
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: TextStyles.font13DarkBlueRegular,
          ),
          
          TextSpan(
            text: ' Sign Up',
            style: TextStyles.font13BlueSemiBold,
            recognizer: tapGestureRecognizer
          ),
        ],
      ),
    );
  }

  
}