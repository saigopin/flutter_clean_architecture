import 'package:easy_localization/easy_localization.dart';
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
                  Text(
                    AppStrings.registerWelcomeText.tr(),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormFieldWidget(
                    labelText: state.firstName.labelText.tr(),
                    onChanged: (String? value) =>
                        onFirstNameChanged(value, context),
                    isError: state.firstName.isError,
                    prefixIcon: const Icon(Icons.person_outline),
                    errorMessage: state.firstName.errorMessage.tr(),
                    hintText: state.firstName.hintText.tr(),
                    isActive: state.firstName.value.isNotEmpty,
                    isRequired: true,
                  ),
                  const SizedBox(height: 15),
                  TextFormFieldWidget(
                    labelText: state.lastName.labelText.tr(),
                    onChanged: (String? value) =>
                        onLastNameChanged(value, context),
                    isError: state.lastName.isError,
                    prefixIcon: const Icon(Icons.person_outline),
                    errorMessage: state.lastName.errorMessage.tr(),
                    hintText: state.lastName.hintText.tr(),
                    isActive: state.lastName.value.isNotEmpty,
                    isRequired: true,
                  ),
                  const SizedBox(height: 15),
                  TextFormFieldWidget(
                    labelText: state.email.labelText.tr(),
                    onChanged: (String? value) =>
                        onEmailChanged(value, context),
                    isError: state.email.isError,
                    prefixIcon: const Icon(Icons.email_outlined),
                    errorMessage: state.email.errorMessage.tr(),
                    hintText: state.email.hintText.tr(),
                    isActive: state.email.value.isNotEmpty,
                    isRequired: true,
                  ),
                  const SizedBox(height: 15),
                  TextFormFieldWidget(
                    labelText: state.password.labelText.tr(),
                    hintText: state.password.hintText.tr(),
                    onChanged: (String? value) =>
                        onPasswordChanged(value, context),
                    obscureText: state.password.showObscureText,
                    prefixIcon: const Icon(Icons.key_outlined),
                    isError: state.password.isError,
                    isActive: state.password.value.isNotEmpty,
                    errorMessage: state.password.errorMessage.tr(),
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
                    labelText: state.confirmPassword.labelText.tr(),
                    hintText: state.confirmPassword.hintText.tr(),
                    onChanged: (String? value) =>
                        onConfirnPasswordChanged(value, context),
                    obscureText: state.confirmPassword.showObscureText,
                    prefixIcon: const Icon(Icons.key_outlined),
                    isError: state.confirmPassword.isError,
                    isActive: state.confirmPassword.value.isNotEmpty,
                    errorMessage: state.confirmPassword.errorMessage.tr(),
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
                    child: Text(AppStrings.register.tr()),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(AppStrings.alreadyHaveAnAccount.tr()),
                      GestureDetector(
                        onTap: () => navigateToLoginScreen(context),
                        child: Text(AppStrings.login.tr()),
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
