import 'package:coupling/contollers/controller_schedule.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  ScheduleController _scheduleController = Get.find();

  @override
  void initState() {
    super.initState();
    _scheduleController.reqEventForMonth(2022, 3);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: Center(
          child: Column(
            children: [
              Text('달력과 등록된 스파링 리스트'),
              ElevatedButton(
                onPressed: () {
                  _scheduleController.reqEventForMonth(2022, 3);
                },
                child: Text('데이터 가져오기 ${_scheduleController.eventList.length}'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/addCompetition');
                },
                child: Text('등록하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
