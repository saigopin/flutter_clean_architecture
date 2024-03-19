import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/single_child_widget.dart';
import 'package:flutter_clean_architecture/src/core/core_exports.dart';
import 'package:flutter_clean_architecture/src/features/auth/auth_exports.dart';
import 'package:flutter_clean_architecture/src/shared/shared_exports.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inject all dependencies
  await initInjections();

  runApp(
    DevicePreview(
      builder: (BuildContext context) {
        return EasyLocalization(
          supportedLocales: getIt<LocalizationService>().getSupportedLocales(),
          startLocale: getIt<LocalizationService>().getFallbackLocale(),
          path: getIt<LocalizationService>().getAssetsPath(),
          fallbackLocale: getIt<LocalizationService>().getFallbackLocale(),
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

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <SingleChildWidget>[
        BlocProvider<ThemeSwitchBloc>(
          create: (_) => getIt<ThemeSwitchBloc>(),
        ),
        BlocProvider<SigninCubit>(
          create: (_) => getIt<SigninCubit>(),
        ),
        BlocProvider<SignupCubit>(
          create: (_) => getIt<SignupCubit>(),
        ),
        BlocProvider<NetworkCubit>(
          create: (_) => getIt<NetworkCubit>(),
        ),
      ],
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NetworkCubit networkCubit;

  @override
  void initState() {
    networkCubit = context.read<NetworkCubit>();
    networkCubit.checkConnectivity();
    networkCubit.trackConnectivityChange();
    super.initState();
  }

  @override
  void dispose() {
    networkCubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (BuildContext context, ThemeSwitchState state) {
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          useInheritedMediaQuery: true,
          child: MaterialApp.router(
            routerConfig: router,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: AppStrings.appName,
            builder: DevicePreview.appBuilder,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.switchValue ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
