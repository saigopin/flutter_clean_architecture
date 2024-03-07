import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_clean_architecture/src/core/core_exports.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final String errorMessage;
  /*  when this [resolveErrorOnInput] is true & 
  if there is any error it will validates the error based on changes */
  final bool resolveErrorOnInput;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final int? maxLength;
  final int maxLines;
  final bool obscureText;
  final String obscuringCharacter;
  final bool readOnly;
  final String? Function(String?)? validator;
  final bool isActive;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? trailingIcon;
  final bool isRequired;
  final bool acceptsOnlyNumbers;
  final bool acceptsNumbersWithDecimals;
  final Function()? trailingIconOnClick;
  final Function(String? value)? onChanged;
  final bool isError;

  const TextFormFieldWidget({
    Key? key,
    required this.hintText,
    this.labelText,
    this.errorMessage = AppStrings.invalidInput,
    this.textAlign = TextAlign.start,
    this.validator,
    this.resolveErrorOnInput = false,
    this.controller,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.maxLines = 1,
    this.obscureText = false,
    this.obscuringCharacter = '*',
    this.readOnly = false,
    this.isActive = false,
    this.isRequired = false,
    this.prefixIcon,
    this.suffixIcon,
    this.trailingIcon,
    this.onChanged,
    this.trailingIconOnClick,
    this.acceptsOnlyNumbers = false,
    this.acceptsNumbersWithDecimals = false,
    this.isError = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> getFormatter() {
      List<TextInputFormatter> inputFormatters = <TextInputFormatter>[];
      if (acceptsOnlyNumbers) {
        inputFormatters.add(FilteringTextInputFormatter.digitsOnly);
      } else if (acceptsNumbersWithDecimals) {
        inputFormatters
            .add(FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')));
      }
      if (inputFormatters.isEmpty) {
        inputFormatters
            .add(FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9.]')));
        inputFormatters = inputFormatters;
      }
      return inputFormatters;
    }

    return TextFormField(
      inputFormatters: getFormatter(),
      textCapitalization: textCapitalization,
      textAlign: textAlign,
      textInputAction: textInputAction,
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLines,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      readOnly: readOnly,
      enableInteractiveSelection: true,
      decoration: InputDecoration(
        hintText: hintText,
        constraints: const BoxConstraints(
          minHeight: 64.0,
          minWidth: 380.0,
        ),
        labelText: labelText,
        floatingLabelStyle: TextStyle(
          color: isError ? AppColors.extraRed : AppColors.button,
        ),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsetsDirectional.only(start: 20, end: 15),
                child: prefixIcon,
              )
            : null,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: isError
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (suffixIcon != null) suffixIcon!,
                    const SizedBox(width: 10),
                    isError
                        ? Icon(
                            Icons.error,
                            color: AppColors.extraRed,
                            size: 20,
                          )
                        : Container(),
                  ],
                )
              : suffixIcon,
        ),
        error: !isError
            ? null
            : Row(
                children: <Widget>[
                  Icon(
                    Icons.info_outline,
                    size: 16,
                    color: AppColors.extraRed,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    errorMessage,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.extraRed,
                    ),
                  )
                ],
              ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isActive ? AppColors.button : AppColors.lightGrey,
          ),
          borderRadius: BorderRadius.circular(Dimenstions.size12),
        ),
        counterText: '',
      ),
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      onChanged: onChanged,
    );
  }
}
