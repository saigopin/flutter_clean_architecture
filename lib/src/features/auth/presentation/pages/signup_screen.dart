import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/core/core_exports.dart';
import 'package:flutter_clean_architecture/src/features/auth/auth_exports.dart';
import 'package:flutter_clean_architecture/src/shared/shared_exports.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void onFirstNameChanged(String? value, BuildContext context) {
    context.read<SignupCubit>().firstNameChanged(BlocFormField(value: value!));
  }

  void onLastNameChanged(String? value, BuildContext context) {
    context.read<SignupCubit>().lastNameChanged(BlocFormField(value: value!));
  }

  void onEmailChanged(String? value, BuildContext context) {
    context.read<SignupCubit>().emailChanged(BlocFormField(value: value!));
  }

  void onPasswordChanged(String? value, BuildContext context) {
    context.read<SignupCubit>().passwordChanged(BlocFormField(value: value!));
  }

  void onConfirnPasswordChanged(String? value, BuildContext context) {
    context
        .read<SignupCubit>()
        .confirmPasswordChanged(BlocFormField(value: value!));
  }

  void togglePassword(BuildContext context) {
    context.read<SignupCubit>().toggleObscureText();
  }

  void toggleConfirmPassword(BuildContext context) {
    context.read<SignupCubit>().toggleConfirmPasswordObscureText();
  }

  void onFormFieldSubmitted(BuildContext context) {
    context.read<SignupCubit>().formSubmitted();
  }

  void navigateToLoginScreen(BuildContext context) {
    context.read<SignupCubit>().formReset();
    getIt
        .get<AppRoutingAbstract>()
        .navigate(context, RouteConstants.kLoginScreen.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: BlocBuilder<SignupCubit, SignupState>(
            builder: (BuildContext context, SignupState state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    AppStrings.registerWelcomeText,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormFieldWidget(
                    labelText: state.firstName.labelText,
                    onChanged: (String? value) =>
                        onFirstNameChanged(value, context),
                    isError: state.firstName.isError,
                    prefixIcon: const Icon(Icons.person_outline),
                    errorMessage: state.firstName.errorMessage,
                    hintText: state.firstName.hintText,
                    isActive: state.firstName.value.isNotEmpty,
                    isRequired: true,
                  ),
                  const SizedBox(height: 15),
                  TextFormFieldWidget(
                    labelText: state.lastName.labelText,
                    onChanged: (String? value) =>
                        onLastNameChanged(value, context),
                    isError: state.lastName.isError,
                    prefixIcon: const Icon(Icons.person_outline),
                    errorMessage: state.lastName.errorMessage,
                    hintText: state.lastName.hintText,
                    isActive: state.lastName.value.isNotEmpty,
                    isRequired: true,
                  ),
                  const SizedBox(height: 15),
                  TextFormFieldWidget(
                    labelText: state.email.labelText,
                    onChanged: (String? value) =>
                        onEmailChanged(value, context),
                    isError: state.email.isError,
                    prefixIcon: const Icon(Icons.email_outlined),
                    errorMessage: state.email.errorMessage,
                    hintText: state.email.hintText,
                    isActive: state.email.value.isNotEmpty,
                    isRequired: true,
                  ),
                  const SizedBox(height: 15),
                  TextFormFieldWidget(
                    labelText: state.password.labelText,
                    hintText: state.password.hintText,
                    onChanged: (String? value) =>
                        onPasswordChanged(value, context),
                    obscureText: state.password.showObscureText,
                    prefixIcon: const Icon(Icons.key_outlined),
                    isError: state.password.isError,
                    isActive: state.password.value.isNotEmpty,
                    errorMessage: state.password.errorMessage,
                    suffixIcon: InkWell(
                      onTap: () => togglePassword(context),
                      child: Icon(
                        !state.password.showObscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormFieldWidget(
                    labelText: state.confirmPassword.labelText,
                    hintText: state.confirmPassword.hintText,
                    onChanged: (String? value) =>
                        onConfirnPasswordChanged(value, context),
                    obscureText: state.confirmPassword.showObscureText,
                    prefixIcon: const Icon(Icons.key_outlined),
                    isError: state.confirmPassword.isError,
                    isActive: state.confirmPassword.value.isNotEmpty,
                    errorMessage: state.confirmPassword.errorMessage,
                    suffixIcon: InkWell(
                      onTap: () => toggleConfirmPassword(context),
                      child: Icon(
                        !state.confirmPassword.showObscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButtonWidget(
                    onPressed: () => onFormFieldSubmitted(context),
                    buttonHeight: 50,
                    buttonWidth: 400,
                    child: const Text(AppStrings.register),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(AppStrings.alreadyHaveAnAccount),
                      GestureDetector(
                        onTap: () => navigateToLoginScreen(context),
                        child: const Text(AppStrings.login),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
