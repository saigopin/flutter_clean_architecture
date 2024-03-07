import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/exports.dart';

mixin TextStyles {
  TextStyle smallTextStyle() => const TextStyle(fontSize: Dimenstions.size12);
  TextStyle mediumTextStyle() => const TextStyle(fontSize: Dimenstions.size18);
  TextStyle largeTextStyle() => const TextStyle(fontSize: Dimenstions.size24);
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
    EdgeInsets padding =
        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  }) {
    return OutlinedButton.styleFrom(
      fixedSize: Size(buttonWidth, buttonHeight),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      side: showBorder ? const BorderSide() : BorderSide.none,
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: disabledTextColor,
      padding: padding,
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
    EdgeInsets padding =
        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  }) {
    return ElevatedButton.styleFrom(
      fixedSize: Size(buttonWidth, buttonHeight),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: disabledTextColor,
      padding: padding,
    );
  }
}
