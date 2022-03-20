import 'package:coupling/contollers/controller_schedule.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScheduleController());
  }
}
