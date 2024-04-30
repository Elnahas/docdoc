import 'package:flutter/material.dart';
import 'package:flutter_advanced_omar_ahmed/core/helpers/app_regex.dart';
import 'package:flutter_advanced_omar_ahmed/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced_omar_ahmed/features/login/ui/widgets/password_validations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  //final formKey = GlobalKey<FormState>(); will in cubit
  bool isObscureText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumbers = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {

    passwordController.addListener(() { 
      setState(() {

        // hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        // hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        // hasSpecialCharacters = AppRegex.hasSpecialCharacter(passwordController.text);
        // hasNumbers = AppRegex.hasNumber(passwordController.text);
        // hasMinLength = AppRegex.hasMinLength(passwordController.text);
        
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Email",
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                return "Please Enter a valid email";
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: "Password",
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child:
                  Icon(isObscureText ? Icons.visibility_off : Icons.visibility),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter a valid password";
              }
            },
            controller: context.read<LoginCubit>().passwordController,
          ),
          verticalSpace(24),
          PasswordValidations(
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasSpecialCharacters: hasSpecialCharacters,
              hasNumbers: hasNumbers,
              hasMinLength: hasMinLength),
        ],
      ),
    );
  }
  
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}