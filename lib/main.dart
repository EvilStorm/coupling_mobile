import 'dart:io';

import 'package:coupling/routers.dart';
import 'package:coupling/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'contollers/contoller_user_info.dart';
import 'contollers/controller_email_sign_in.dart';
import 'contollers/controller_sign.dart';
import 'contollers/controller_third_party_signin.dart';
import 'firebase_options.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(UserInfoController());
    Get.put(SignController());
    Get.put(ThirdPartySignInController());
    Get.put(EmailSignInController());

    return GetMaterialApp(
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!);
      },
      title: '스파링 클럽',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: Routers().allPageRouter,
      theme: Themes.lightTheme,
    );
  }
}
