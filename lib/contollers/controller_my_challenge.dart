import 'package:coupling/contollers/basic_controller_fn.dart';
import 'package:coupling/contollers/contoller_user_info.dart';
import 'package:coupling/network/http_client.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../models/model_competition.dart';
import '../utils/print_log.dart';

class MyChallengeController extends GetxController
    with BasicControllorFunctions {
  RxList eventList = <CompetitionModel>[].obs;
  UserInfoController _userInfoController = Get.find();

  MyChallengeController() {
    reqMyChallenge();
  }

  void reqMyChallenge() async {
    if (_userInfoController.userInfo.isBlank ?? true) {
      return;
    }

    try {
      final response = await HttpClient.instance
          .get('challenge/all/${_userInfoController.userInfo.value.id}');

      if (response['code'] == 200) {
        eventList.value = (response['data'] as List)
            .map((item) => CompetitionModel.fromJson(item))
            .toList();
      } else {
        Fluttertoast.showToast(msg: response['message']);
      }
    } catch (e) {
      Log.e(e);
      responseException(e);
    }
  }
}
