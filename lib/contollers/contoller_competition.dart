import 'package:coupling/contollers/controller_map_search.dart';
import 'package:coupling/models/model_map_address.dart';
import 'package:get/get.dart';

import '../utils/print_log.dart';

class CompetitionController extends GetxController {
  MapSearchController _mapSearchController = Get.find();

  Rx<MapAddressModel> selectedPos = MapAddressModel().obs;

  CompetitionController() {
    // ever(_mapSearchController.selectedAddress, (MapAddressModel value) {
    //   Log.e(" address: ${value.addressComponents}");
    //   selectedPos.value = value;
    // });

    // _mapSearchController.selectedAddress.listen((p0) {
    //   Log.e(" address: ${p0.addressComponents}");
    //   selectedPos.value = p0;
    // });
  }
}
