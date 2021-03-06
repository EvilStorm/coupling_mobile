import 'package:coupling/contollers/contoller_make_profile.dart';
import 'package:coupling/contollers/controller_schedule.dart';
import 'package:get/get.dart';

import '../contollers/controller_my_challenge.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScheduleController());
    Get.lazyPut(() => MakeProfileController());
    Get.lazyPut(() => MyChallengeController());
  }
}
