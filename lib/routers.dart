import 'package:coupling/screens/sign/screen_sign_in.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'binders/binding_signin.dart';
import 'screens/home/screen_home.dart';
import 'screens/sign/email_validation.dart';
import 'screens/splash/sceen_splash.dart';

class Routers {
  final allPageRouter = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(
        name: '/signIn',
        page: () => const SignInScreen(),
        binding: SignInBinding()),
    GetPage(
        name: '/emailValidation', page: () => const EmailValidationScreen()),
    GetPage(name: '/home', page: () => const HomeScreen()),
  ];
}
