import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_clean_architecture/src/core/exports.dart';
import 'package:flutter_clean_architecture/src/core/utils/constants/app_strings.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final String errorMessage;
  /*  when this [resolveErrorOnInput] is true & 
  if there is any error it will validates the error based on changes */
  final bool resolveErrorOnInput;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign = TextAlign.start;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final int? maxLength;
  final int maxLines;
  final bool obscureText;
  final String obscuringCharacter;
  final bool readOnly;
  final String? Function(String?)? validator;

  const TextFormFieldWidget({
    Key? key,
    required this.hintText,
    this.errorMessage = AppStrings.invalidInput,
    this.validator,
    this.resolveErrorOnInput = false,
    required this.controller,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isError = ValueNotifier<bool>(false);

    return ValueListenableBuilder<bool>(
      valueListenable: isError,
      builder: (BuildContext context, bool hasError, Widget? child) {
        return TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            constraints: const BoxConstraints(
              minHeight: 64.0,
              minWidth: 380.0,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.lightGrey,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.lightGrey,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.extraRed,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.button,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.extraRed,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            labelText: hintText,
            labelStyle: TextStyle(
              fontSize: 16,
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
            floatingLabelStyle: TextStyle(
              color: isError.value ? AppColors.extraRed : AppColors.button,
            ),
            hintStyle: TextStyle(
              color: AppColors.textHint,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            error: !isError.value
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
            errorStyle: TextStyle(color: AppColors.extraRed),
          ),
          style: TextStyle(
            fontSize: 16,
            color: isError.value ? AppColors.extraRed : AppColors.black,
            fontWeight: FontWeight.w400,
          ),
          validator: (String? value) {
            isError.value = validator?.call(value) != null;

            return null;
          },
          onChanged: (String? value) {
            isError.value = isError.value && validator?.call(value) != null;
          },
          inputFormatters: inputFormatters,
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
        );
      },
    );
  }
}
