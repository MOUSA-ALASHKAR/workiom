import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/core/translations/app_translations.dart';
import 'package:flutter_project/core/utils/general_util.dart';
import 'package:flutter_project/ui/views/splash_screen/splash_screen.dart';
import 'package:get/get.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // void initState() {
  //   SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp , DeviceOrientation.landscapeLeft , DeviceOrientation.landscapeLeft],
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return GetMaterialApp(
            defaultTransition: Transition.cupertino,
            transitionDuration: Duration(milliseconds: 300),
            translations: AppTranslation(),
            locale: getLocal(),
            fallbackLocale: getLocal(),
            builder: BotToastInit(), //1. call BotToastInit
            navigatorObservers: [BotToastNavigatorObserver()],
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              textTheme: TextTheme(),
            ),

        home: SplashScreen());
  }
}

Locale getLocal() {
  if (storage.getAppLanguage() == 'ar') {
    return Locale('ar', 'SA');
  } else {
    return Locale('en', 'US');
  }
}