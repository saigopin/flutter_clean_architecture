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
      errorMessage: 'Invalid Name',
      hintText: 'Enter First Name',
      labelText: 'First Name',
    ),
    this.lastName = const BlocFormField(
      errorMessage: 'Invalid Last Name',
      hintText: 'Enter Last Name',
      labelText: 'Last Name',
    ),
    this.email = const BlocFormField(
      errorMessage: 'Invalid Email',
      hintText: 'Enter Email',
      labelText: 'Email',
    ),
    this.password = const BlocFormField(
      hintText: 'Enter Password',
      labelText: 'Password',
      errorMessage: 'Invalid Password',
      showObscureText: true,
    ),
    this.confirmPassword = const BlocFormField(
      hintText: 'Enter Confirm Password',
      labelText: 'Confirm Password',
      errorMessage: 'Invalid Confirm Password',
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
