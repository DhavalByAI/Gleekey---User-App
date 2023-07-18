import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/Intro_pages/splashScreen.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

import 'utils/style/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox('gleekey');

  // await Firebase.initializeApp();
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const MyApp(), // UnWrap your app
  //   ),
  // );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
    );
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      title: 'Gleekey',
      theme: ThemeData(
        primaryColor: kOrange,
        primarySwatch: Colors.deepOrange,
        unselectedWidgetColor: kOrange,
        fontFamily: 'HankenGrotesk',
      ),
      supportedLocales: const [Locale('en', 'US')],
      home: SplashPage(),
    );
  }
}
