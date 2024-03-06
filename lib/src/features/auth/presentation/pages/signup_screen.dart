import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/core/injections.dart';
import 'package:flutter_clean_architecture/src/core/routing/app_routing_abstract/app_routing_abstract.dart';
import 'package:flutter_clean_architecture/src/core/routing/route_constants.dart';
import 'package:flutter_clean_architecture/src/core/styles/app_colors.dart';
import 'package:flutter_clean_architecture/src/features/auth/presentation/cubit/signup/signup_cubit.dart';
import 'package:flutter_clean_architecture/src/shared/domain/entities/bloc_form_field.dart';
import 'package:flutter_clean_architecture/src/shared/presentation/widgets/custom_button_widget.dart';
import 'package:flutter_clean_architecture/src/shared/shared.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                    'Welcome Back,\nCreate Account to Continue',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormFieldWidget(
                    labelText: state.firstName.labelText,
                    onChanged: (String? value) => context
                        .read<SignupCubit>()
                        .firstNameChanged(BlocFormField(value: value!)),
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
                    onChanged: (String? value) => context
                        .read<SignupCubit>()
                        .lastNameChanged(BlocFormField(value: value!)),
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
                    onChanged: (String? value) => context
                        .read<SignupCubit>()
                        .emailChanged(BlocFormField(value: value!)),
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
                    onChanged: (String? value) => context
                        .read<SignupCubit>()
                        .passwordChanged(BlocFormField(value: value!)),
                    obscureText: state.password.showObscureText,
                    prefixIcon: const Icon(Icons.key_outlined),
                    isError: state.password.isError,
                    isActive: state.password.value.isNotEmpty,
                    errorMessage: state.password.errorMessage,
                    suffixIcon: InkWell(
                      onTap: () {
                        context.read<SignupCubit>().toggleObscureText();
                      },
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
                    onChanged: (String? value) => context
                        .read<SignupCubit>()
                        .confirmPasswordChanged(BlocFormField(value: value!)),
                    obscureText: state.confirmPassword.showObscureText,
                    prefixIcon: const Icon(Icons.key_outlined),
                    isError: state.confirmPassword.isError,
                    isActive: state.confirmPassword.value.isNotEmpty,
                    errorMessage: state.confirmPassword.errorMessage,
                    suffixIcon: InkWell(
                      onTap: () {
                        context
                            .read<SignupCubit>()
                            .toggleConfirmPasswordObscureText();
                      },
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
                    onPressed: () {
                      context.read<SignupCubit>().formSubmitted();
                    },
                    buttonHeight: 50,
                    buttonWidth: 400,
                    child: const Text('SignUp'),
                  ),
                  const SizedBox(height: 20),
                  IconButton(
                    onPressed: () => getIt
                        .get<AppRoutingAbstract>()
                        .navigate(context, RouteConstants.kLoginScreen.path),
                    icon: const Icon(Icons.app_registration_rounded),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
