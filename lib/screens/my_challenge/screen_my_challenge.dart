import 'package:coupling/contollers/controller_sign.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../contollers/contoller_user_info.dart';

class MyChallengeScreen extends StatefulWidget {
  const MyChallengeScreen({Key? key}) : super(key: key);

  @override
  State<MyChallengeScreen> createState() => _MyChallengeScreenState();
}

class _MyChallengeScreenState extends State<MyChallengeScreen> {
  final UserInfoController _userInfoController = Get.find();
  final SignController _signController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Obx(
          () => Stack(
            children: [
              Visibility(
                visible: _userInfoController.userInfo.value.identifyId == null,
                child: ElevatedButton(
                  onPressed: () => _signController.signInContollerStart(false),
                  child: Text('로그인'),
                ),
              ),
              Visibility(
                visible: _userInfoController.userInfo.value.identifyId != null,
                child:
                    Text('userInfo ${_userInfoController.userInfo.value.id}'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
