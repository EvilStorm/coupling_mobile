import 'package:coupling/network/http_client.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../utils/print_log.dart';
import 'basic_controller_fn.dart';
import 'contoller_user_info.dart';

class MakeProfileController extends GetxController
    with BasicControllorFunctions {
  final UserInfoController _userInfoController = Get.find();

  final TextEditingController nickNameController = TextEditingController();
  final TextEditingController historyController = TextEditingController();
  final TextEditingController kakaoIdController = TextEditingController();

  final heightList = List.generate(100, (index) => 130 + index);
  final ageList = List.generate(80, (index) => (20 + index));
  final weightList = List.generate(200, (index) => (40 + index));

  var gender = 0.obs;
  RxInt age = 30.obs;
  var height = 160.obs;
  var weight = 80.obs;

  bool checkInputValidation() {
    if (nickNameController.text.trim().length < 3) {
      Fluttertoast.showToast(msg: '닉네임은 최소 3자입니다.');
      return false;
    }
    if (kakaoIdController.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: '카카오톡 ID를 입력해주세요.');
      return false;
    }

    return true;
  }

  void setMyProfile() async {
    if (!checkInputValidation()) {
      return;
    }
    _userInfoController.userInfo.value.id;

    try {
      final response = await HttpClient.instance.patch(
        '/user',
        body: {
          'nickName': nickNameController.text.trim(),
          'age': age.value,
          'gender': gender.value,
          'height': height.value,
          'weight': weight.value,
          'kakaoTalkId': kakaoIdController.text.trim(),
          'history': historyController.text.trim(),
        },
      );
      if (response['code'] == 200) {
        if (response['data']['result'] == 0) {
          Fluttertoast.showToast(msg: response['data']['message']);
          return;
        }
        _userInfoController.userInfo.value.nickName =
            nickNameController.text.trim();
        _userInfoController.userInfo.value.age = age.value;
        _userInfoController.userInfo.value.gender = gender.value;
        _userInfoController.userInfo.value.height = height.value;
        _userInfoController.userInfo.value.weight = weight.value;
        _userInfoController.userInfo.value.kakaoTalkId =
            kakaoIdController.text.trim();
        _userInfoController.userInfo.value.history =
            historyController.text.trim();

        Get.back();
      } else {
        Fluttertoast.showToast(msg: response['message']);
        Log.i("Respose COde: ${response['code']}");
      }
    } catch (e) {
      Log.i(e);
      responseException(e);
    }
  }
}
