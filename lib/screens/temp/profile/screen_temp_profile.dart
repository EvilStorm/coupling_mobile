import 'package:coupling/contollers/contoller_user_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TempProfileScreen extends StatefulWidget {
  const TempProfileScreen({Key? key}) : super(key: key);

  @override
  State<TempProfileScreen> createState() => _TempProfileScreenState();
}

class _TempProfileScreenState extends State<TempProfileScreen> {
  UserInfoController _userInfoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 30,
          child: CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/noperson.png',
            ),
            radius: 29,
          ),
        ),
      ],
    );
  }
}
