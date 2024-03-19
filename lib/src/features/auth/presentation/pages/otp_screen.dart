import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/core_exports.dart';
import 'package:flutter_clean_architecture/src/shared/presentation/widgets/otp_widget.dart';
import 'package:flutter_clean_architecture/src/shared/shared_exports.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          leading: IconButton(
            onPressed: () => getIt
                .get<AppRoutingAbstract>()
                .navigate(context, RouteConstants.kLoginScreen.path),
            icon: const Icon(
              Icons.arrow_back_sharp,
              weight: 1.0,
            ),
          ),
          title: Text(
            AppStrings.enterOTP.tr(),
            style: const TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
          centerTitle: false,
          titleSpacing: 0,
          shape: Border(bottom: BorderSide(color: AppColors.silverGrey)),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    OTPWidget(
                      onOtpEntered: (String value) {},
                      isError: true,
                    ),
                    const SizedBox(height: 20),
                    Visibility(
                      visible: false,
                      child: CustomButtonWidget(
                        onPressed: () {},
                        buttonHeight: 50,
                        customButtonType: CustomButtonType.outlined,
                        borderColor: AppColors.button,
                        borderRadius: 8.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.refresh_outlined,
                              color: AppColors.button,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              AppStrings.resendOTP,
                              style: TextStyle(
                                color: AppColors.button,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
            child: CustomButtonWidget(
              onPressed: () {},
              buttonHeight: 55,
              buttonWidth: MediaQuery.of(context).size.width,
              child: const Text(AppStrings.verifyOTP),
            ),
          ),
        ],
      ),
    );
  }
}
