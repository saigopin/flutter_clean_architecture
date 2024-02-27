import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/src/core/utils/constants/app_strings.dart';
import 'package:flutter_clean_architecture/src/core/utils/injections.dart';
import 'package:flutter_clean_architecture/src/features/home/presentation/pages/articles_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'src/core/exports.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inject all dependencies
  await initInjections();

  runApp(
    DevicePreview(
      builder: (BuildContext context) {
        return ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(sl<AppSharedPrefs>()),
          child: const MyApp(),
        );
      },
      enabled: false,
    ),
  );

  SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
<<<<<<< HEAD
        BlocProvider<ThemeSwitchBloc>(
          create: (_) => sl<ThemeSwitchBloc>(),
        ),
=======
        BlocProvider<ThemeSwitchBloc>(create: (_) => ThemeSwitchBloc())
>>>>>>> 20a3449 (added theme)
      ],
      child: BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
        builder: (BuildContext context, ThemeSwitchState state) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp(
              navigatorKey: navigatorKey,
              title: AppStrings.appName,
              builder: DevicePreview.appBuilder,
<<<<<<< HEAD
              theme: state.switchValue ? darkTheme : lightTheme,
=======
              theme: state.switchValue
                  ? AppThemes.appThemeData[AppTheme.darkTheme]
                  : AppThemes.appThemeData[AppTheme.lightTheme],
>>>>>>> 20a3449 (added theme)
              debugShowCheckedModeBanner: false,
              home: const AritclesPage(),
            ),
          );
        },
      ),
    );
  }
}
