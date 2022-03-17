import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../models/model_simple.dart';
import '../network/http_client.dart';
import '../utils/print_log.dart';
import 'contoller_user_info.dart';

class NickNameController extends GetxController {
  final TextEditingController nickNameController = TextEditingController();

  @override
  void onClose() {
    nickNameController.dispose();
    super.onClose();
  }

  bool checkIdValidation() {
    if (nickNameController.text == "" || nickNameController.text.length < 2) {
      Fluttertoast.showToast(msg: '사용할 수 없는 아이디 입니다.');
      return false;
    }
    return true;
  }

  Future<bool> postId() async {
    if (!checkIdValidation()) return false;

    try {
      final response = await HttpClient.instance
          .patch('/user', body: {'nickName': nickNameController.text});

      if (response['code'] == 200) {
        var result = ModelSimple.fromMap(response['data']);
        if (result.result == 1) {
          UserInfoController _userInfoController = Get.find();
          _userInfoController.setUserNickName(nickNameController.text);

          return true;
        } else {
          Fluttertoast.showToast(msg: result.message);
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      Log.e(e);
      return false;
    }
  }
}
