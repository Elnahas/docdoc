import 'package:flutter/material.dart';
import 'package:flutter_advanced_omar_ahmed/core/helpers/spacing.dart';
import 'package:flutter_advanced_omar_ahmed/core/theming/colors.dart';
import 'package:flutter_advanced_omar_ahmed/core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumbers;
  final bool hasMinLength;

  const PasswordValidations(
      {super.key,
      required this.hasLowerCase,
      required this.hasUpperCase,
      required this.hasSpecialCharacters,
      required this.hasNumbers,
      required this.hasMinLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow("At least 1 lowercase letter", hasLowerCase),
        verticalSpace(2),
        buildValidationRow("At least 1 uppercase letter", hasUpperCase),
        verticalSpace(2),
        buildValidationRow("At least 1 Special Characters letter", hasSpecialCharacters),
        verticalSpace(2),
        buildValidationRow("At least 1 hasNumbers letter", hasNumbers),
        verticalSpace(2),
        buildValidationRow("At least 8 Min Length letter", hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.gray,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
              decoration: hasValidated ? TextDecoration.lineThrough : null,
              decorationColor: Colors.green,
              decorationThickness: 2,
              color:
                  hasValidated ? ColorsManager.gray : ColorsManager.darkBlue),
        )
      ],
    );
  }
}
