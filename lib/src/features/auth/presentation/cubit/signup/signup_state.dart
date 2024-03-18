part of 'signup_cubit.dart';

class SignupState extends Equatable {
  final BlocFormField email;
  final BlocFormField firstName;
  final BlocFormField lastName;
  final BlocFormField password;
  final BlocFormField confirmPassword;
  final GlobalKey<FormState>? formKey;

  const SignupState({
    this.firstName = const BlocFormField(
      errorMessage: AppStrings.firstNameErrMsg,
      hintText: AppStrings.firstNameHint,
      labelText: AppStrings.firstName,
    ),
    this.lastName = const BlocFormField(
      errorMessage: AppStrings.lastNameErrMsg,
      hintText: AppStrings.lastNameHint,
      labelText: AppStrings.lastName,
    ),
    this.email = const BlocFormField(
      errorMessage: AppStrings.emailErrorMsg,
      hintText: AppStrings.emailHint,
      labelText: AppStrings.emailErrorMsg,
    ),
    this.password = const BlocFormField(
      hintText: AppStrings.passwordHint,
      labelText: AppStrings.password,
      errorMessage: AppStrings.passwordErrorMsg,
      showObscureText: true,
    ),
    this.confirmPassword = const BlocFormField(
      hintText: AppStrings.confirmPasswordHint,
      labelText: AppStrings.confirmPassword,
      errorMessage: AppStrings.confirmPasswordErrorMsg,
      showObscureText: true,
    ),
    this.formKey,
  });

  SignupState copyWith({
    BlocFormField? email,
    BlocFormField? firstName,
    BlocFormField? lastName,
    BlocFormField? password,
    BlocFormField? confirmPassword,
    GlobalKey<FormState>? formKey,
  }) {
    return SignupState(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formKey: formKey ?? this.formKey,
    );
  }

  @override
  List<Object> get props =>
      <Object>[email, password, confirmPassword, firstName, lastName];
}

final class SignupInitial extends SignupState {}
