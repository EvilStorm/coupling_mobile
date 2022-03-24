import 'package:coupling/constants/constants.dart';
import 'package:coupling/contollers/controller_my_challenge.dart';
import 'package:coupling/contollers/controller_sign.dart';
import 'package:coupling/screens/my_challenge/widget/added_competition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../contollers/contoller_user_info.dart';

class MyChallengeScreen extends StatefulWidget {
  const MyChallengeScreen({Key? key}) : super(key: key);

  @override
  State<MyChallengeScreen> createState() => _MyChallengeScreenState();
}

class _MyChallengeScreenState extends State<MyChallengeScreen>
    with TickerProviderStateMixin {
  final UserInfoController _userInfoController = Get.find();
  final SignController _signController = Get.find();
  final MyChallengeController _myChallengeController = Get.find();
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Obx(
          () => Stack(
            children: [
              Visibility(
                visible: _userInfoController.userInfo.value.id == null,
                child: ElevatedButton(
                  onPressed: () => _signController.signInContollerStart(false),
                  child: const Text('로그인'),
                ),
              ),
              Visibility(
                visible: _userInfoController.userInfo.value.id != null,
                child: Column(
                  children: [
                    TabBar(controller: _tabController, tabs: [
                      Padding(
                        padding: const EdgeInsets.all(Constants.sapceGap),
                        child: Text(
                          '내가 등록',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(Constants.sapceGap),
                        child: Text(
                          '내가 도전',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ]),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          AddedCompetition(),
                          Tab(
                            text: '내가 도전',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
