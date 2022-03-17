import 'package:get/get.dart';

import '../models/model_user.dart';

class UserInfoController extends GetxController {
  Rx<UserModel> userInfo = UserModel().obs;

  void setUserInfo(UserModel data) {
    userInfo.value = data;
    if (data.nickName == null || data.age == null) {
      Get.toNamed('/makeProfile');
    } else {
      Get.offAllNamed('/home');
    }
  }

  void setUserNickName(nickName) {
    userInfo.value.nickName = nickName;
  }
}
