import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/features/auth/presentation/widget/button_widget.dart';

extension LoadingButton on ButtonWidget {
  Widget isLoading(bool isLoading) {
    return isLoading
        ? Align(
            alignment: alignment,
            child: SizedBox(
              width: width,
              child: ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
                ),
                child: const SizedBox.square(
                  dimension: 24,
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
          )
        : this;
  }
}
