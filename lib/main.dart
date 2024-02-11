import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/src/core/helper/helper.dart';
import 'package:flutter_clean_architecture/src/core/theme/theme.dart';
import 'package:flutter_clean_architecture/src/core/utils/constants/app_strings.dart';
import 'package:flutter_clean_architecture/src/core/utils/injections.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/presentation/pages/articles_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async{
WidgetsFlutterBinding.ensureInitialized();

  // Inject all dependencies
  await initInjections();

  runApp(DevicePreview(
    builder: (context) {
      return const MyApp();
    },
    enabled: false,
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppNotifier(),
      child: Consumer(
        builder: (context, value, child) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            
            child: MaterialApp(
              navigatorKey: navigatorKey,
              title: AppStrings.appName,
                builder: DevicePreview.appBuilder,
             theme: buildThemeData(context: context,isDarkTheme: Helper.isDarkTheme()),
                      debugShowCheckedModeBanner: false,
              home: const AritclesPage(),
            ),
          );
        }
      ),
    );
  }
}


// App notifier for Lang, Theme, ...
class AppNotifier extends ChangeNotifier {
  late bool darkTheme;

  AppNotifier() {
    _initialise();
  }

  Future _initialise() async {
    darkTheme = Helper.isDarkTheme();
    notifyListeners();
  }

  void updateThemeTitle(bool newDarkTheme) {
    darkTheme = newDarkTheme;
    if (Helper.isDarkTheme()) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
    notifyListeners();
  }
}
