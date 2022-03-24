import 'package:coupling/contollers/controller_schedule.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  ScheduleController _scheduleController = Get.find();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _scheduleController.reqEventForMonth(selectedDate.year, selectedDate.month);
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> eventList = _scheduleController.getByDate(selectedDate);
    return Obx(
      () => Container(
        child: Center(
          child: Column(
            children: [
              TableCalendar(
                focusedDay: selectedDate,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                eventLoader: (date) {
                  return _scheduleController.getByDate(date);
                },
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDate, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    selectedDate = focusedDay;
                  });
                },
              ),
              Divider(height: 1),
              Expanded(
                child: eventList.isEmpty
                    ? Center(
                        child: Text(
                          "해당 날짜에 매치가 없습니다.",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      )
                    : ListView.separated(
                        itemCount: eventList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              eventList[index].title,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            trailing: Text(
                              DateFormat('kk:mm').format(DateTime.parse(
                                  eventList[index]
                                      .matchTime
                                      .substring(
                                          0, eventList[0].matchTime.length - 1)
                                      .replaceAll('T', ' '))),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(height: 1);
                        },
                      ),
              ),
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
