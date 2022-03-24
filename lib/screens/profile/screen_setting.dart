import 'package:coupling/contollers/controller_sign.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final SignController _signController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _signController.signOut();
              Get.back();
            },
            child: Text('로그아웃'),
          )
        ],
      ),
    );
  }
}
