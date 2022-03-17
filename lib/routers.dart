import 'package:coupling/screens/sign/screen_sign_in.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'screens/home/screen_home.dart';
import 'screens/splash/sceen_splash.dart';

class Routers {
  final allPageRouter = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/signIn', page: () => const SignInScreen()),
    GetPage(name: '/home', page: () => const HomeScreen()),
  ];
}
