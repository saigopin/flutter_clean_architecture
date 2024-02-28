import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/exports.dart';

class CustomButtonWidget extends StatelessWidget with ButtonStyles {
  final VoidCallback onPressed;
  final Widget? icon;
  final String text;
  final double borderRadius;
  final double width;
  final Alignment alignment;
  final EdgeInsets contentPadding;

  const CustomButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.borderRadius = 8.0,
    this.width = double.infinity,
    this.alignment = Alignment.topRight,
    this.icon,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 10,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: SizedBox(
        width: width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: customButtonStyle(
            contentPadding: contentPadding,
            borderRadius: borderRadius,
          ),
          child: Row(
            children: <Widget>[
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: icon!,
                ),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
