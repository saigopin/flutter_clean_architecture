import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/core/core_exports.dart';
import 'package:flutter_clean_architecture/src/shared/shared_exports.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(const SigninState()) {
    init();
    formReset();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void init() {
    emit(state.copyWith(formKey: formKey));
  }

  void emailChanged(BlocFormField email) {
    final BlocFormField existingEmail = state.email;
    emit(
      state.copyWith(
        email: existingEmail.copyWith(
          value: email.value,
        ),
      ),
    );
  }

  void passwordChanged(BlocFormField password) {
    final BlocFormField existingPassword = state.password;
    emit(
      state.copyWith(
        password: existingPassword.copyWith(
          value: password.value,
        ),
      ),
    );
  }

  void toggleObscureText() {
    final BlocFormField existingPassword = state.password;
    emit(
      state.copyWith(
        password: existingPassword.copyWith(
          showObscureText: !existingPassword.showObscureText,
        ),
      ),
    );
  }

  void formReset() {
    emit(
      state.copyWith(
        email: state.email.copyWith(
          isError: false,
          value: '',
        ),
        password: state.password.copyWith(
          isError: false,
          value: '',
        ),
      ),
    );
  }

  void formSubmitted() {
    final BlocFormField email = state.email;
    final BlocFormField password = state.password;

    // Validate and set error messages here
    final bool emailError = !email.value.isValidEmail || email.value.isEmpty;

    final bool passwordError =
        !password.value.isValidPassword || password.value.isEmpty;

    // Update the state with the validated values and error messages
    emit(
      state.copyWith(
        email: email.copyWith(
          isError: emailError,
        ),
        password: password.copyWith(
          isError: passwordError,
        ),
      ),
    );
  }
}
