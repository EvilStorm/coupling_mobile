import 'package:get/get.dart';

import 'contoller_user_info.dart';

class MakeProfileController extends GetxController {
  var pageIndex = 0.obs;

  void moveNextPage() {
    pageIndex++;
  }

  void movePrevPage() {
    pageIndex--;
  }

  void calcStartIndex() {
    UserInfoController userInfoController = Get.find();
    if (userInfoController.userInfo.value.nickName == null) {
      pageIndex.value = 0;
    } else if (userInfoController.userInfo.value.age == null) {
      pageIndex.value = 1;
    } else {
      pageIndex.value = 0;
    }
  }
}
