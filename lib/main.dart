import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/core/utils/constants/app_strings.dart';
import 'package:flutter_clean_architecture/src/core/utils/injections.dart';
import 'package:flutter_clean_architecture/src/features/home/presentation/pages/articles_page.dart';
import 'package:flutter_clean_architecture/src/shared/presentation/bloc/theme_switch/theme_switch_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/single_child_widget.dart';

import 'src/core/exports.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inject all dependencies
  await initInjections();

  // created the storage variable instance to store the data in local storage
  HydratedStorage storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  // using the HydratedBloc to implement the Hydrated bloc storage
  HydratedBloc.storage = storage;

  runApp(DevicePreview(
    builder: (BuildContext context) {
      return const MyApp();
    },
    enabled: false,
  ));

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
      providers: <SingleChildWidget>[
        BlocProvider<ThemeSwitchBloc>(
          create: (_) => getIt<ThemeSwitchBloc>(),
        ),
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
              theme: state.switchValue
                  ? AppThemes.appThemeData[AppTheme.darkTheme]
                  : AppThemes.appThemeData[AppTheme.lightTheme],
              debugShowCheckedModeBanner: false,
              home: const AritclesPage(),
            ),
          );
        },
      ),
    );
  }
}
