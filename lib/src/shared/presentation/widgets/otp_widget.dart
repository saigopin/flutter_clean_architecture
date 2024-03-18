import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/src/core/core_exports.dart';

class OTPWidget extends StatefulWidget {
  final void Function(String otp) onOtpEntered;
  final bool isError;
  const OTPWidget({
    super.key,
    required this.onOtpEntered,
    this.isError = false,
  });

  @override
  State<OTPWidget> createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(6, (int index) => TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            controllers.length,
            (int index) => buildOTPField(index),
          ),
        ),
        Visibility(
          visible: widget.isError,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6.0,
              vertical: 10,
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.info_outline,
                  color: AppColors.extraRed,
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  'Incorrect OTP',
                  style: TextStyle(
                    color: AppColors.extraRed,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildOTPField(int index) {
    return Container(
      alignment: Alignment.center,
      width: 60,
      padding: const EdgeInsets.only(right: 5),
      child: TextFormField(
        controller: controllers[index],
        textAlign: TextAlign.center,
        maxLength: 1,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
        ],
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 16,
          ),
          constraints: const BoxConstraints(
            maxWidth: 60,
            maxHeight: 80,
          ),
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: widget.isError ? AppColors.extraRed : Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: widget.isError ? AppColors.extraRed : Colors.transparent,
            ),
          ),
          fillColor: widget.isError
              ? AppColors.otpErrorBackground
              : AppColors.otpBackground,
          filled: true,
        ),
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w400,
        ),
        keyboardType: TextInputType.number,
        onChanged: (String value) {
          if (value.isNotEmpty && index < controllers.length - 1) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }

          if (isOtpEntered()) {
            String otp = controllers
                .map((TextEditingController controller) => controller.text)
                .join();
            widget.onOtpEntered(otp);
          }
        },
      ),
    );
  }

  bool isOtpEntered() {
    return controllers.every(
        (TextEditingController controller) => controller.text.isNotEmpty);
  }

  @override
  void dispose() {
    for (TextEditingController controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
