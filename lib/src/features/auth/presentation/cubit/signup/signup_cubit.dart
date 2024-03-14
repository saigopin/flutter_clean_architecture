import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/core/core_exports.dart';
import 'package:flutter_clean_architecture/src/shared/shared_exports.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial()) {
    init();
    formReset();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void init() {
    emit(
      state.copyWith(formKey: formKey),
    );
  }

  void emailChanged(BlocFormField email) {
    final BlocFormField existingEmail = state.email;
    emit(
      state.copyWith(
        email: existingEmail.copyWith(value: email.value),
      ),
    );
  }

  void firstNameChanged(BlocFormField firstName) {
    final BlocFormField existingFirstName = state.firstName;
    emit(
      state.copyWith(
        firstName: existingFirstName.copyWith(
          value: firstName.value,
        ),
      ),
    );
  }

  void lastNameChanged(BlocFormField lastName) {
    final BlocFormField existingLastName = state.lastName;
    emit(
      state.copyWith(
        lastName: existingLastName.copyWith(
          value: lastName.value,
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

  void confirmPasswordChanged(BlocFormField confirmPassword) {
    final BlocFormField existingConfirmPassword = state.confirmPassword;
    emit(
      state.copyWith(
        confirmPassword: existingConfirmPassword.copyWith(
          value: confirmPassword.value,
        ),
      ),
    );
  }

  void toggleObscureText() {
    final BlocFormField exsistingPassword = state.password;

    emit(
      state.copyWith(
        password: exsistingPassword.copyWith(
          showObscureText: !exsistingPassword.showObscureText,
        ),
      ),
    );
  }

  void toggleConfirmPasswordObscureText() {
    final BlocFormField existingConfirmPassword = state.confirmPassword;

    emit(
      state.copyWith(
        confirmPassword: existingConfirmPassword.copyWith(
          showObscureText: !existingConfirmPassword.showObscureText,
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
        firstName: state.firstName.copyWith(
          isError: false,
          value: '',
        ),
        lastName: state.lastName.copyWith(
          isError: false,
          value: '',
        ),
        confirmPassword: state.confirmPassword.copyWith(
          isError: false,
          errorMessage: AppStrings.confirmPasswordErrorMsg,
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
    final BlocFormField confirmPassword = state.confirmPassword;

    // Validate and set error messages here
    final bool emailError = !email.value.isValidEmail || email.value.isEmpty;

    final bool passwordError =
        !password.value.isValidPassword || password.value.isEmpty;

    final bool confirmPasswordError =
        !confirmPassword.value.isValidPassword || confirmPassword.value.isEmpty;

    final bool isPasswordMatched =
        password.value.isEqual(confirmPassword.value);

    final String confirmPasswordErrorMsg = confirmPasswordError
        ? AppStrings.confirmPasswordErrorMsg
        : (!confirmPasswordError && !isPasswordMatched)
            ? AppStrings.passwordNotMatched
            : AppStrings.confirmPasswordErrorMsg;

    // Update the state with the validated values and error messages
    emit(
      state.copyWith(
        firstName: state.firstName.copyWith(
          isError: state.firstName.value.isEmpty,
        ),
        lastName: state.lastName.copyWith(
          isError: state.lastName.value.isEmpty,
        ),
        email: email.copyWith(
          isError: emailError,
        ),
        password: password.copyWith(
          isError: passwordError,
        ),
        confirmPassword: confirmPassword.copyWith(
          isError: confirmPasswordError || !isPasswordMatched,
          errorMessage: confirmPasswordErrorMsg,
        ),
      ),
    );
  }
}
