import 'package:coupling/contollers/basic_controller_fn.dart';
import 'package:coupling/contollers/contoller_user_info.dart';
import 'package:coupling/network/http_client.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../models/model_competition.dart';
import '../models/model_competition_detail.dart';
import '../utils/print_log.dart';

class MyChallengeController extends GetxController
    with BasicControllorFunctions {
  RxList<CompetitionDetailModel> competitionList =
      <CompetitionDetailModel>[].obs;
  RxList<CompetitionDetailModel> opponentList = <CompetitionDetailModel>[].obs;
  UserInfoController _userInfoController = Get.find();

  @override
  void onInit() {
    super.onInit();

    ever(_userInfoController.userInfo, (_) {
      reqMyChallenge();
    });
  }

  void selectChallenger(int competitionId, int challengerId) async {
    final response = await HttpClient.instance.post(
        '/competition/select/challenger',
        body: {'competitionId': competitionId, 'challengerId': challengerId});

    if (response['code'] == 200) {
      reqMyChallenge();
    } else if (response['code'] == 254) {
    } else {
      Fluttertoast.showToast(msg: response['message']);
    }
  }

  void reqMyChallenge() async {
    if (_userInfoController.userInfo.value.id == null) {
      return;
    }

    try {
      final response = await HttpClient.instance.get(
          '/challenge/competition/${_userInfoController.userInfo.value.id}');
      // final response =
      //     await HttpClient.instance.get('/challenge/competition/34');

      if (response['code'] == 200) {
        competitionList.value = (response['data'] as List)
            .map((item) => CompetitionDetailModel.fromJson(item))
            .toList();
      } else if (response['code'] == 254) {
      } else {
        Fluttertoast.showToast(msg: response['message']);
      }

      final oppoResponse = await HttpClient.instance
          .get('/challenge/opponent/${_userInfoController.userInfo.value.id}');
      // final oppoResponse =
      //     await HttpClient.instance.get('/challenge/opponent/34');

      if (oppoResponse['code'] == 200) {
        opponentList.value = (oppoResponse['data'] as List)
            .map((item) => CompetitionDetailModel.fromJson(item))
            .toList();
      } else if (oppoResponse['code'] == 254) {
      } else {
        Fluttertoast.showToast(msg: oppoResponse['message']);
      }
    } catch (e) {
      Log.e(e);
      responseException(e);
    }
  }
}
