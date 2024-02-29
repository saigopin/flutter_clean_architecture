import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/exports.dart';

mixin TextStyles {
  TextStyle smallTextStyle() =>
      const TextStyle(fontSize: Dimenstions.smallTextSize);
  TextStyle mediumTextStyle() =>
      const TextStyle(fontSize: Dimenstions.mediumTextSize);
  TextStyle largeTextStyle() =>
      const TextStyle(fontSize: Dimenstions.largeTextSize);
}

mixin ButtonStyles {
  ButtonStyle outlinedButtonStyle({
    required double buttonWidth,
    required double buttonHeight,
    required double borderRadius,
    required Function() onPressed,
    required bool isButtonDisabled,
    required bool showBorder,
    Color? disabledBackgroundColor,
    Color? disabledTextColor,
  }) {
    return OutlinedButton.styleFrom(
      fixedSize: Size(buttonWidth, buttonHeight),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      side: showBorder ? const BorderSide() : BorderSide.none,
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: disabledTextColor,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    );
  }

  ButtonStyle elevatedButtonStyle({
    required double buttonWidth,
    required double buttonHeight,
    required double borderRadius,
    required Function() onPressed,
    bool isButtonDisabled = false,
    Color? disabledBackgroundColor,
    Color? disabledTextColor,
  }) {
    return ElevatedButton.styleFrom(
      fixedSize: Size(buttonWidth, buttonHeight),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: disabledTextColor,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    );
  }
}
