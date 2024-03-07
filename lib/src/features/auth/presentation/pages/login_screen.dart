import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/core/core.dart';
import 'package:flutter_clean_architecture/src/features/auth/auth.dart';
import 'package:flutter_clean_architecture/src/shared/shared.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: BlocConsumer<SigninCubit, SigninState>(
            listener: (BuildContext context, SigninState state) {
              // Add any necessary listener logic here
            },
            builder: (BuildContext context, SigninState state) {
              return Form(
                key: context.read<SigninCubit>().formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      AppStrings.loginWelcomeText,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormFieldWidget(
                      labelText: state.email.labelText,
                      onChanged: (String? value) => context
                          .read<SigninCubit>()
                          .emailChanged(BlocFormField(value: value!)),
                      isError: state.email.isError,
                      prefixIcon: const Icon(Icons.person_outline),
                      errorMessage: state.email.errorMessage,
                      hintText: state.email.hintText,
                      isActive: state.email.value.isNotEmpty,
                      isRequired: true,
                    ),
                    const SizedBox(height: 20),
                    TextFormFieldWidget(
                      labelText: state.password.labelText,
                      hintText: state.password.hintText,
                      onChanged: (String? value) => context
                          .read<SigninCubit>()
                          .passwordChanged(BlocFormField(value: value!)),
                      obscureText: state.password.showObscureText,
                      prefixIcon: const Icon(Icons.key),
                      isError: state.password.isError,
                      isActive: state.password.value.isNotEmpty,
                      errorMessage: state.password.errorMessage,
                      suffixIcon: InkWell(
                        onTap: () {
                          context.read<SigninCubit>().toggleObscureText();
                        },
                        child: Icon(
                          !state.password.showObscureText
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButtonWidget(
                      onPressed: () {
                        context.read<SigninCubit>().formSubmitted();
                      },
                      buttonHeight: 50,
                      buttonWidth: 400,
                      child: const Text(AppStrings.login),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(AppStrings.dontHaveAnAccount),
                        GestureDetector(
                            onTap: () {
                              context.read<SigninCubit>().formReset();
                              getIt.get<AppRoutingAbstract>().navigate(
                                  context, RouteConstants.kSignUpScreen.path);
                            },
                            child: const Text(AppStrings.register)),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
