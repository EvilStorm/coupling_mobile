import 'dart:async';

import 'package:coupling/models/model_map_address.dart';
import 'package:coupling/network/http_client.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../utils/print_log.dart';

class MapSearchController extends GetxController {
  RxList searchAddressList = <MapAddressModel>[].obs;
  Rx<MapAddressModel> selectedAddress = MapAddressModel().obs;
  String? searchWord;

  final int searchTimer = 500;

  DateTime searchTime = DateTime.now();
  Timer? _addressSearchTimer;

  void searchAddress(String address) {
    //마지막 입력 후 0.4초 뒤에 검색을 실행한다.
    _addressSearchTimer?.cancel();
    _addressSearchTimer = Timer(Duration(milliseconds: searchTimer), () {
      _searchAddress(address);
    });

    if (DateTime.now().millisecond - searchTime.millisecond > searchTimer) {
      _searchAddress(address);
    }
  }

  void _searchAddress(String address) async {
    final response = await HttpClient.instance.getOtherPlatform(
      'maps.googleapis.com',
      '/maps/api/geocode/json',
      queryParams: {
        'region': 'KR',
        'language': 'ko',
        'address': address,
        'key': 'AIzaSyDlOrEAcZ5BkQZLpC0XcMZByNuvZ3Md-JY'
      },
    );
    if (response['status'] == 'OK') {
      searchTime = DateTime.now();
      var result = response['results'];
      Log.e("result: ${result.length}");
      searchAddressList.value = (response['results'] as List)
          .map((item) => MapAddressModel.fromJson(item))
          .toList();

      // Log.e(response);
    }
  }
}
