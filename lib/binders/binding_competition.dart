import 'package:coupling/contollers/contoller_competition.dart';
import 'package:get/get.dart';

import '../contollers/controller_map_search.dart';

class CompetitionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MapSearchController(), fenix: true);
    Get.lazyPut(() => CompetitionController());
  }
}
