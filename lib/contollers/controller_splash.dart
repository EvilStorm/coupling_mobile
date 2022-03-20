import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../constants/key_store.dart';
import '../models/model_app_init.dart';
import '../models/model_app_update.dart';
import '../network/http_client.dart';
import '../screens/common/dialog_basic.dart';
import '../utils/print_log.dart';
import 'basic_controller_fn.dart';
import 'controller_sign.dart';

class SplashController extends GetxController
    with StateMixin<AppInitModel>, BasicControllorFunctions {
  final _storage = GetStorage();

  SplashController() {
    getAppInitData();
  }

  late AppInitModel _model;

  void getAppInitData() async {
    final _packageInfo = await PackageInfo.fromPlatform();
    final notifySeq = _storage.read(KeyStore.notifySeq_I) ?? 0;
    final termSeq = _storage.read(KeyStore.termSeq_I) ?? 0;
    var appVersion = _storage.read(KeyStore.appVer_I) ?? 0;
    if (int.parse(_packageInfo.buildNumber) > appVersion) {
      appVersion = int.parse(_packageInfo.buildNumber);
    }

    try {
      final response = await HttpClient.instance
          .get('/appStart/init/$appVersion/$notifySeq/$termSeq');

      if (response['code'] == 200) {
        _model = AppInitModel.fromMap(response['data']);

        _setInitSplashProcess();
        checkProcess();
      } else {
        Log.i("Respose COde: ${response['code']}");
      }
    } catch (e) {
      Log.i(e);
      responseException(e);
    }
  }

  void _launchStore() {}

  void _showNessearyUpdatePop(AppUpdateModel data) {
    Get.dialog(
      BasicDialog(
        title: "필수 업데이트",
        message: data.message,
        leftBtnTitle: "종료",
        leftBtnAction: () => exit(0),
        rightBtnTitle: "업데이트",
        rightBtnAction: () => _launchStore(),
        rightBtnAccent: true,
      ),
      barrierDismissible: false,
    );
  }

  void _showUpdatePop(AppUpdateModel data) {
    Get.dialog(
      BasicDialog(
        message: data.message,
        leftBtnTitle: "건너뛰기",
        leftBtnAction: () {
          _model.setProcessStateChanged(0, false);
          Log.e("data.seq: ${data.seq}");

          _storage.write(KeyStore.appVer_I, data.seq);
          Get.back();
        },
        rightBtnTitle: "업데이트",
        rightBtnAction: () => _launchStore(),
      ),
      barrierDismissible: false,
    );
  }

  void _setInitSplashProcess() {
    if (_model.appVer != null) {
      _model.setProcessStateChanged(0, false);
      if (_model.appVer?.nessesary == 1) {
        _showNessearyUpdatePop(_model.appVer!);
      } else {
        _showUpdatePop(_model.appVer!);
      }
    }
    if (_model.notify != null && (_model.notify?.length ?? 0) > 0) {
      _model.setProcessStateChanged(1, false);
    }
    if (_model.term != null) {
      _model.setProcessStateChanged(2, false);
    }
  }

  void _dataChange() {
    change(_model, status: RxStatus.success());
  }

  void readNotify(int seq) {
    _storage.write(KeyStore.notifySeq_I, seq);
  }

  void agreeTerm(int seq) {
    _storage.write(KeyStore.termSeq_I, seq);
  }

  void checkProcess() {
    if (_model.processState.contains(false)) {
      _dataChange();
    } else {
      // 로그인은 필요할 떄 호출로 변경
      // final SignController _controller = Get.find();
      // _controller.signInContollerStart();
      Get.offAndToNamed('/home');
    }
  }
}
