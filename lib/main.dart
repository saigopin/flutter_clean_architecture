import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/core/routing/routes.dart';
import 'package:flutter_clean_architecture/src/core/utils/constants/app_strings.dart';
import 'package:flutter_clean_architecture/src/core/injections.dart';
import 'package:flutter_clean_architecture/src/features/auth/presentation/cubit/signin/signin_cubit.dart';
import 'package:flutter_clean_architecture/src/features/auth/presentation/cubit/signup/signup_cubit.dart';
import 'package:flutter_clean_architecture/src/shared/presentation/bloc/theme_switch/theme_switch_bloc.dart';
import 'package:flutter_clean_architecture/src/shared/presentation/cubit/cubit/internet_cubit.dart';
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
          child: MaterialApp.router(
            routerConfig: router,
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
