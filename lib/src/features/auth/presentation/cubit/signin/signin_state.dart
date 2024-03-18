part of 'signin_cubit.dart';

class SigninState extends Equatable {
  final BlocFormField email;
  final BlocFormField password;
  final GlobalKey<FormState>? formKey;

  const SigninState({
    this.email = const BlocFormField(
      errorMessage: AppStrings.emailErrorMsg,
      hintText: AppStrings.emailHint,
      labelText: AppStrings.email,
    ),
    this.password = const BlocFormField(
      hintText: AppStrings.passwordHint,
      labelText: AppStrings.password,
      errorMessage: AppStrings.passwordErrorMsg,
      showObscureText: true,
    ),
    this.formKey,
  });

  SigninState copyWith({
    BlocFormField? email,
    BlocFormField? password,
    GlobalKey<FormState>? formKey,
  }) {
    return SigninState(
      email: email ?? this.email,
      password: password ?? this.password,
      formKey: formKey,
    );
  }

  @override
  List<Object> get props => <Object>[email, password];
}

class SigninInitial extends SigninState {}
