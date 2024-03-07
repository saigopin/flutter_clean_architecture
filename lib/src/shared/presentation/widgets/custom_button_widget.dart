import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/core.dart';

class CustomButtonWidget extends StatelessWidget with ButtonStyles {
  final CustomButtonType customButtonType;
  final Widget child;
  final double buttonWidth;
  final double buttonHeight;
  final double borderRadius;
  final Function() onPressed;
  final Color? disabledBackgroundColor;
  final Color? disabledTextColor;
  final bool isButtonDisabled;
  final bool showBorder;
  final EdgeInsets padding;

  const CustomButtonWidget({
    super.key,
    required this.onPressed,
    this.customButtonType = CustomButtonType.elevated,
    required this.child,
    this.buttonWidth = 188,
    this.buttonHeight = 64,
    this.borderRadius = 8.0,
    this.disabledBackgroundColor,
    this.disabledTextColor,
    this.isButtonDisabled = false,
    this.showBorder = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  });

  @override
  Widget build(BuildContext context) {
    switch (customButtonType) {
      case CustomButtonType.outlined:
        return OutlinedButton(
          onPressed: isButtonDisabled ? null : onPressed,
          style: outlinedButtonStyle(
            buttonWidth: buttonWidth,
            buttonHeight: buttonHeight,
            borderRadius: borderRadius,
            onPressed: onPressed,
            isButtonDisabled: isButtonDisabled,
            showBorder: showBorder,
            disabledBackgroundColor: disabledBackgroundColor,
            disabledTextColor: disabledTextColor,
            padding: padding,
          ),
          child: child,
        );
      default:
        return ElevatedButton(
          onPressed: isButtonDisabled ? null : onPressed,
          style: elevatedButtonStyle(
            buttonWidth: buttonWidth,
            buttonHeight: buttonHeight,
            borderRadius: borderRadius,
            onPressed: onPressed,
            isButtonDisabled: isButtonDisabled,
            disabledBackgroundColor: disabledBackgroundColor,
            disabledTextColor: disabledTextColor,
          ),
          child: child,
        );
    }
  }
}
