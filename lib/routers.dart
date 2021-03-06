import 'package:coupling/screens/common/google_map.dart';
import 'package:coupling/screens/make_profile/screen_make_profile.dart';
import 'package:coupling/screens/profile/screen_setting.dart';
import 'package:coupling/screens/sign/screen_sign_in.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'binders/binding_competition.dart';
import 'binders/binding_home.dart';
import 'binders/binding_make_profile.dart';
import 'binders/binding_signin.dart';
import 'screens/home/screen_home.dart';
import 'screens/schedule/screen_add_competition.dart';
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
    GetPage(
        name: '/home', page: () => const HomeScreen(), binding: HomeBinding()),
    GetPage(
        name: '/addCompetition',
        page: () => const AddCompetitionScreen(),
        binding: CompetitionBinding()),
    GetPage(name: '/showMap', page: () => const MapForGoogle()),
    GetPage(
      name: '/makeProfile',
      page: () => const MakeProfileScreen(),
      binding: MakeProfileBinding(),
    ),
    GetPage(name: '/setting', page: () => const SettingScreen()),
  ];
}
