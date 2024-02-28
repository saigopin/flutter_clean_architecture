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
  ButtonStyle customButtonStyle({
    required EdgeInsets contentPadding,
    required double borderRadius,
  }) {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(contentPadding),
    );
  }
}
