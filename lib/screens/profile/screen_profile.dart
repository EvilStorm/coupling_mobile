import 'package:coupling/constants/constants.dart';
import 'package:coupling/contollers/contoller_user_info.dart';
import 'package:coupling/contollers/controller_sign.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../contollers/contoller_make_profile.dart';
import '../common/toggle_animate.dart';
import '../make_profile/widgets/basic_info_row_wapper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserInfoController _userInfoController = Get.find();

  final SignController _signController = Get.find();
  final MakeProfileController _profileController = Get.find();

  @override
  void initState() {
    super.initState();

    restoreMyInfo();
  }

  void restoreMyInfo() {
    _profileController.nickNameController.text =
        _userInfoController.userInfo.value.nickName ?? '닉네임 설정';
    _profileController.age.value = _userInfoController.userInfo.value.age ?? 23;
    _profileController.gender.value =
        _userInfoController.userInfo.value.gender ?? 0;
    _profileController.height.value =
        _userInfoController.userInfo.value.height ?? 170;
    _profileController.weight.value =
        _userInfoController.userInfo.value.weight ?? 70;
    _profileController.kakaoIdController.text =
        _userInfoController.userInfo.value.kakaoTalkId ?? 'none';
    _profileController.historyController.text =
        _userInfoController.userInfo.value.history ?? 'none';
  }

  void saveChange() {
    _userInfoController.userInfo.value.nickName =
        _profileController.nickNameController.text;
    _userInfoController.userInfo.value.age = _profileController.age.value;
    _userInfoController.userInfo.value.gender = _profileController.gender.value;
    _userInfoController.userInfo.value.height = _profileController.height.value;
    _userInfoController.userInfo.value.weight = _profileController.weight.value;
    _userInfoController.userInfo.value.kakaoTalkId =
        _profileController.kakaoIdController.text;
    _userInfoController.userInfo.value.history =
        _profileController.historyController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Visibility(
            visible: _userInfoController.userInfo.value.id == null,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  _signController.signInContollerStart(false);
                },
                child: Text('로그인'),
              ),
            ),
          ),
          Visibility(
            visible: _userInfoController.userInfo.value.id != null,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(Constants.sapceGap),
                child: Obx(
                  () => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            radius: 30,
                            child: const CircleAvatar(
                              backgroundImage: AssetImage(
                                'assets/images/noperson.png',
                              ),
                              radius: 29,
                            ),
                          ),
                          const SizedBox(
                            width: Constants.sapceGap,
                          ),
                          Expanded(
                            child: TextField(
                              controller: _profileController.nickNameController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Get.toNamed('/setting');
                              },
                              icon: Icon(Icons.settings))
                        ],
                      ),
                      rowGender(context),
                      rowAge(context),
                      rowHeight(context),
                      rowWeight(context),
                      const SizedBox(
                        height: Constants.sapceGap,
                      ),
                      listItemWithTextField('카카오ID', '매칭상대에게 보여질 아이디',
                          _profileController.kakaoIdController),
                      const SizedBox(
                        height: Constants.sapceGap,
                      ),
                      historyWidget(context),
                      ElevatedButton(
                        onPressed: () async {
                          var result = await _profileController.saveProfile();
                          if (result) {
                            saveChange();
                          }
                        },
                        child: const Text('변경'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BasicInfoItemWidget rowGender(BuildContext context) {
    return BasicInfoItemWidget(
      title: '성별',
      child: AnimatedToggle(
        values: const ['여자', '남자'],
        onToggleCallback: (value) {
          _profileController.gender.value = value;
        },
        buttonColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        textColor: const Color(0xFFFFFFFF),
      ),
    );
  }

  BasicInfoItemWidget rowWeight(BuildContext context) {
    return BasicInfoItemWidget(
      title: '몸무게',
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: DropdownButton<int>(
              value: _profileController.weight.value,
              onChanged: (item) {
                _profileController.weight.value = item!;
              },
              items: _profileController.weightList.map<DropdownMenuItem<int>>(
                (item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        '$item',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                  );
                },
              ).toList()),
        ),
      ),
    );
  }

  BasicInfoItemWidget rowHeight(BuildContext context) {
    return BasicInfoItemWidget(
      title: '키',
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: DropdownButton<int>(
              value: _profileController.height.value,
              onChanged: (item) {
                _profileController.height.value = item!;
              },
              items: _profileController.heightList.map<DropdownMenuItem<int>>(
                (item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        '$item',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                  );
                },
              ).toList()),
        ),
      ),
    );
  }

  BasicInfoItemWidget rowAge(BuildContext context) {
    return BasicInfoItemWidget(
      title: '나이',
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: DropdownButton<int>(
              value: _profileController.age.value,
              onChanged: (item) {
                _profileController.age.value = item!;
              },
              items: _profileController.ageList.map<DropdownMenuItem<int>>(
                (item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        '$item',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                  );
                },
              ).toList()),
        ),
      ),
    );
  }

  Row listItemWithTextField(
      String title, String hint, TextEditingController controller) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        const SizedBox(
          width: Constants.sapceGap,
        ),
        Expanded(
          flex: 8,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ),
      ],
    );
  }

  Column historyWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '경력',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        const SizedBox(
          height: Constants.sapceGap / 2,
        ),
        SizedBox(
          height: 170,
          child: TextField(
            controller: _profileController.historyController,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: '경력, 수상 이력등 자신의 경험을 적어주세요. ',
              hintStyle: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ),
      ],
    );
  }
}
