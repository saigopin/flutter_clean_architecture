import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/routing/app_routing_abstract/app_routing_abstract.dart';
import 'package:flutter_clean_architecture/src/core/routing/route_constants.dart';
import 'package:flutter_clean_architecture/src/core/injections.dart';
import 'package:flutter_clean_architecture/src/core/styles/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ignore: always_specify_types
      Future.delayed(const Duration(seconds: 2), () {
        String email = '';
        if (email.isEmpty) {
          getIt
              .get<AppRoutingAbstract>()
              .navigate(context, RouteConstants.kLoginScreen.path);
        } else {
          getIt
              .get<AppRoutingAbstract>()
              .navigate(context, RouteConstants.kHomeScreen.path);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.button,
      body: Center(
        child: Text(
          'Clean Arch',
          style: TextStyle(
            fontSize: 25,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
