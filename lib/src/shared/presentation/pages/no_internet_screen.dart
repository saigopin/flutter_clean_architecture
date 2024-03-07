import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/core/assets/assets.dart';
import 'package:flutter_clean_architecture/src/core/enums/enums.dart';
import 'package:flutter_clean_architecture/src/core/styles/app_colors.dart';
import 'package:flutter_clean_architecture/src/core/utils/constants/app_strings.dart';
import 'package:flutter_clean_architecture/src/shared/presentation/cubit/cubit/internet_cubit.dart';
import 'package:flutter_clean_architecture/src/shared/presentation/widgets/custom_button_widget.dart';
import 'package:flutter_svg/svg.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              Assets.noInternet,
              width: 120,
              colorFilter: ColorFilter.mode(
                AppColors.black,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'No Internet',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            CustomButtonWidget(
              onPressed: () {},
              customButtonType: CustomButtonType.outlined,
              showBorder: false,
              buttonHeight: 80,
              buttonWidth: 150,
              child: InkWell(
                onTap: () => context.read<NetworkCubit>().checkConnectivity(),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.refresh, size: 30),
                    Text(
                      AppStrings.refresh,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
