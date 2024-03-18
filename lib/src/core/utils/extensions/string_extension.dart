/// Extension on [String] to provide email validation.
extension StringExtension on String {
  /// Checks if the current string is a valid email address.
  bool get isValidEmail {
    final RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegExp.hasMatch(this);
  }

  /// Checks if the current string is a valid phone number.
  bool get isValidPhone {
    final RegExp phoneRegExp = RegExp(r'^(?:[+0]9)?[0-9]{10}$');
    return phoneRegExp.hasMatch(this);
  }

  /// Checks if the current string is a valid password.
  /// A valid password should have at least one uppercase letter,
  /// one lowercase letter, one digit, one special character,
  /// and a minimum length of 8 characters.
  bool get isValidPassword {
    RegExp passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    return passwordRegex.hasMatch(this);
  }

  /// Checks if the current string is equal to the provided input.
  bool isEqual(String input) {
    return this == input;
  }
}
