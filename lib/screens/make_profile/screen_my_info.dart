import 'package:flutter/material.dart';

class MyInfoScreen extends StatefulWidget {
  const MyInfoScreen({Key? key}) : super(key: key);

  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('내 정보 입력'),
      ),
    );
  }
}
