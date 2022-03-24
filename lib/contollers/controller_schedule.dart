import 'package:coupling/models/model_map_address.dart';
import 'package:coupling/network/http_client.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/model_competition.dart';
import '../utils/print_log.dart';
import 'basic_controller_fn.dart';

class ScheduleController extends GetxController with BasicControllorFunctions {
  RxList eventList = <CompetitionModel>[].obs;
  MapAddressModel? location;
  late int _year;
  late int _month;
  void reqEventForMonth(int year, int month) async {
    _year = year;
    _month = month;
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

  List<dynamic> getByDate(DateTime date) {
    return eventList
        .where((event) => isSameDay(
            date,
            DateTime.parse(event.matchTime
                .substring(0, eventList[0].matchTime.length - 1)
                .replaceAll('T', ' '))))
        .toList();
  }

  void setLocation(location) {
    this.location = location;
  }

  void refresh() {
    reqEventForMonth(_year, _month);
  }
}
