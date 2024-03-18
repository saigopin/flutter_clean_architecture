import 'package:equatable/equatable.dart';

class BlocFormField extends Equatable {
  final String errorMessage;
  final bool isError;
  final String value;
  final String hintText;
  final String labelText;
  final bool showObscureText;

  const BlocFormField({
    this.errorMessage = '',
    this.isError = false,
    this.value = '',
    this.hintText = '',
    this.labelText = '',
    this.showObscureText = false,
  });

  BlocFormField copyWith({
    String? errorMessage,
    String? value,
    bool? isError,
    String? hintText,
    String? labelText,
    bool? showObscureText,
  }) {
    return BlocFormField(
      errorMessage: errorMessage ?? this.errorMessage,
      isError: isError ?? this.isError,
      value: value ?? this.value,
      hintText: hintText ?? this.hintText,
      labelText: labelText ?? this.labelText,
      showObscureText: showObscureText ?? this.showObscureText,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        errorMessage,
        isError,
        value,
        hintText,
        labelText,
        showObscureText
      ];
}
