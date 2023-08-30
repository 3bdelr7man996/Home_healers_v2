import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'config/bloc_config/bloc_observer.dart';
import 'config/bloc_config/bloc_provider.dart';
import 'config/themes/app_themes.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/cache_helper.dart';
import 'features/auth/presentation/pages/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        home: const SignUpScreen(),
      ),
    );
  }
}
