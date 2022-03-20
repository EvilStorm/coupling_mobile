import 'package:get/get.dart';

import '../contollers/controller_email_sign_in.dart';
import '../contollers/controller_third_party_signin.dart';
import '../utils/print_log.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Log.e(' Binding dependencies SignInBinding');
  }
}
