import 'package:coupling/network/http_client.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../models/model_competition.dart';
import '../utils/print_log.dart';
import 'basic_controller_fn.dart';

class ScheduleController extends GetxController with BasicControllorFunctions {
  RxList eventList = <CompetitionModel>[].obs;

  void reqEventForMonth(int year, int month) async {
    try {
      final response =
          await HttpClient.instance.get('/competition/monthly/$year/$month');

      if (response['code'] == 200) {
        eventList.value = (response['data'] as List)
            .map((item) => CompetitionModel.fromJson(item))
            .toList();
      }
    } catch (e) {
      Log.e(e);
      responseException(e);
    }
  }

  void addEvent(String title, String location, String locationPosition,
      String locationName, DateTime matchTime, String? messge) async {
    try {
      final response = await HttpClient.instance.post('/competition', body: {
        'title': title,
        'location': location,
        'locationName': locationName,
        'matchTime': matchTime,
        'locationLatLng': locationPosition,
        'messge': messge,
      });
      if (response['code'] == 200) {
        Fluttertoast.showToast(msg: '등록되었습니다.');
      }
    } catch (e) {
      Log.e(e);
      responseException(e);
    }
  }
}
