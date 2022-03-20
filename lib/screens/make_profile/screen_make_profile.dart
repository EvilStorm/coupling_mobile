import 'package:coupling/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../contollers/contoller_make_profile.dart';
import '../common/toggle_animate.dart';
import 'widgets/basic_info_row_wapper.dart';

class MakeProfileScreen extends StatefulWidget {
  const MakeProfileScreen({Key? key}) : super(key: key);

  @override
  _MakeProfileScreenState createState() => _MakeProfileScreenState();
}

class _MakeProfileScreenState extends State<MakeProfileScreen> {
  final MakeProfileController _profileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 16.0),
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    listItemWithTextField('닉네임', '최소 3자리 닉네임을 적어주세요.',
                        _profileController.nickNameController),
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
                      onPressed: () {
                        _profileController.setMyProfile();
                      },
                      child: const Text('등록'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
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
          height: 200,
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
