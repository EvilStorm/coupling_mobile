import 'package:coupling/screens/make_profile/screen_my_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../contollers/contoller_make_profile.dart';
import 'screen_nickname.dart';

class MakeProfileScreen extends StatefulWidget {
  const MakeProfileScreen({Key? key}) : super(key: key);

  @override
  _MakeProfileScreenState createState() => _MakeProfileScreenState();
}

class _MakeProfileScreenState extends State<MakeProfileScreen> {
  final MakeProfileController profileController = Get.find();

  @override
  void initState() {
    profileController.calcStartIndex();
    super.initState();
  }


  var pageList = [
    const NickNameScreen(),
    const MyInfoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 16.0),
            child: Obx(() => pageList[profileController.pageIndex.value]),
          ),
        ),
      ),
    );
  }
}
