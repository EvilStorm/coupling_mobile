import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../screens/common/dialog_basic.dart';
import '../utils/print_log.dart';

class BasicControllorFunctions {
  responseException(Object e) {
    Log.e(e);

    Get.dialog(
      BasicDialog(
        title: "죄송합니다.",
        message: "일적인 문제로 앱 사용이 불가능합니다.\n잠시 후 다시 시도해주세요.\n지속될 경우 업데이트를 진행해주세요.",
        rightBtnTitle: "종료",
        rightBtnAction: () => exit(0),
        rightBtnAccent: true,
      ),
      barrierDismissible: false,
    );
  }

  void showRetryMessage() {
    Fluttertoast.showToast(msg: "네트워크에 일시적인 문제가 발생했습니다.\n잠시 후 다시 시도 해주세요.");
  }
}
