import 'package:get/get.dart';

import '../contollers/contoller_make_profile.dart';
import '../contollers/contoller_nickname.dart';

class MakeProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MakeProfileController>(MakeProfileController());
    Get.lazyPut(() => NickNameController());
  }
}
