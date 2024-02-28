import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/routing/app_routing_abstract/app_routing_abstract.dart';
import 'package:flutter_clean_architecture/src/core/routing/route_constants.dart';
import 'package:flutter_clean_architecture/src/core/utils/injections.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      getIt
          .get<AppRoutingAbstract>()
          .navigate(context, RouteConstants.kHomeScreen.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
