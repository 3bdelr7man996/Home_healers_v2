import 'package:bloc/bloc.dart';
import 'package:dr/doctor/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:dr/features/auth/presentation/pages/select_roll_for_sign_in.dart';
import 'package:dr/features/splash/presentation/pages/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'di_container.dart' as di;
import 'package:bot_toast/bot_toast.dart';

import 'config/bloc_config/bloc_observer.dart';
import 'config/bloc_config/bloc_provider.dart';
import 'config/themes/app_themes.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.serviceLocatorInit();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      path: AppStrings.localizationPath,
      fallbackLocale: const Locale('en', 'US'),
      startLocale: const Locale('ar', 'EG'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return blocMultiProvider(
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        builder: BotToastInit(),
        home: const SelectRollForSignIn(),
        //const SignUpScreen(),
        //const SelectRollForSignIn(),
        // const  SplashScreen ()
      ),
    );
  }
}
