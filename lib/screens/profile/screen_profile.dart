import 'package:coupling/constants/constants.dart';
import 'package:coupling/contollers/contoller_user_info.dart';
import 'package:coupling/contollers/controller_sign.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('userInfo ${_userInfoController.userInfo.value.id}'),
                    const SizedBox(
                      height: Constants.sapceGap,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _signController.signOut();
                      },
                      child: Text('로그아웃'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
