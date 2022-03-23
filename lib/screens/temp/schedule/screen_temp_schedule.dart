import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../contollers/controller_schedule.dart';

class TempScheduleScreen extends StatefulWidget {
  const TempScheduleScreen({Key? key}) : super(key: key);

  @override
  State<TempScheduleScreen> createState() => _TempScheduleScreenState();
}

class _TempScheduleScreenState extends State<TempScheduleScreen> {
  ScheduleController _scheduleController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
