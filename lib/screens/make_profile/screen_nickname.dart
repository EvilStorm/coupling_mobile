import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../contollers/contoller_make_profile.dart';
import '../../contollers/contoller_nickname.dart';

class NickNameScreen extends StatefulWidget {
  const NickNameScreen({Key? key}) : super(key: key);

  @override
  _NickNameScreenState createState() => _NickNameScreenState();
}

class _NickNameScreenState extends State<NickNameScreen> {
  final NickNameController nickNameController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: '아이디\n\n\n',
                  style: Theme.of(context).textTheme.subtitle1),
              TextSpan(
                  text: '아이디를 적어주세요.',
                  style: Theme.of(context).textTheme.bodyText1),
              TextSpan(
                  text: ' (최소 3자리)',
                  style: Theme.of(context).textTheme.caption),
            ],
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        TextField(
          controller: nickNameController.nickNameController,
        ),
        const SizedBox(
          height: 8.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () async {
              bool result = await nickNameController.postId();
              if (result) {
                MakeProfileController _profileController = Get.find();
                _profileController.moveNextPage();
              }
            },
            child: const Text('확인'),
          ),
        )
      ],
    );
  }
}
