import 'package:flutter/material.dart';
import 'package:flutter_advanced_omar_ahmed/core/helpers/extentions.dart';
import 'package:flutter_advanced_omar_ahmed/core/routing/routes.dart';
import 'package:flutter_advanced_omar_ahmed/core/theming/colors.dart';
import 'package:flutter_advanced_omar_ahmed/core/theming/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorsManager.mainBlue),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 52)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))
      ),
      child: Text(
        "Get Started",
        style: TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
