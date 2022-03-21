import 'package:coupling/contollers/basic_controller_fn.dart';
import 'package:coupling/models/model_map_address.dart';
import 'package:coupling/network/http_client.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../utils/print_log.dart';
import 'controller_schedule.dart';

class CompetitionController extends GetxController
    with BasicControllorFunctions {
  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  MapAddressModel? location;
  String? locationName;
  DateTime? date;

  bool validationCheck() {
    if (titleController.text.isEmpty ||
        messageController.text.isEmpty ||
        location == null ||
        locationName == null ||
        date == null) return false;

    return true;
  }

  void addCompetition() async {
    if (!validationCheck()) {
      Fluttertoast.showToast(msg: '모든 항목을 적어주세요!');
      return;
    }
    try {
      final response = await HttpClient.instance.post('/competition', body: {
        'title': titleController.text.trim(),
        'message': messageController.text.trim(),
        'locationName': locationName,
        'location': location!.formattedAddress,
        // 'locationLatLng': location!.geometry!.location,
        'locationLatLng': {
          'type': 'Point',
          'coordinates': [
            location!.geometry!.location!.lat,
            location!.geometry!.location!.lng
          ]
        },
        'matchTime': date!.toIso8601String()
      });

      if (response['code'] == 200) {
        ScheduleController _controller = Get.find();
        _controller.refresh();

        Get.back();
      } else {
        Fluttertoast.showToast(msg: response['message']);
      }
    } catch (e) {
      Log.e(e);
      showRetryMessage();
    }
  }
}
