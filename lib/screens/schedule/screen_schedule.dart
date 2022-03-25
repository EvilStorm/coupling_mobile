import 'package:coupling/contollers/controller_schedule.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../contollers/contoller_user_info.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  ScheduleController _scheduleController = Get.find();
  UserInfoController _userInfoController = Get.find();
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
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  eventList[index].title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  DateFormat('kk:mm').format(DateTime.parse(
                                      eventList[index]
                                          .matchTime
                                          .substring(0,
                                              eventList[0].matchTime.length - 1)
                                          .replaceAll('T', ' '))),
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            trailing: (eventList[index].opponentId != null ||
                                    _userInfoController.userInfo.value.id ==
                                        null ||
                                    _userInfoController.userInfo.value.id ==
                                        eventList[index].user.id ||
                                    DateTime.now().isAfter(DateTime.parse(
                                        eventList[index]
                                            .matchTime
                                            .substring(
                                                0,
                                                eventList[0].matchTime.length -
                                                    1)
                                            .replaceAll('T', ' '))))
                                ? null
                                : ElevatedButton(
                                    onPressed: () {
                                      _scheduleController
                                          .reqChallenge(eventList[index].id);
                                    },
                                    child: Text('도전하기'),
                                  ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    title: Text(
                                      eventList[index].title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "닉네임: " +
                                              eventList[index].user.nickName,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                            color:
                                                Color.fromARGB(255, 85, 85, 85),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "나이: " +
                                              eventList[index]
                                                  .user
                                                  .age
                                                  .toString(),
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                            color:
                                                Color.fromARGB(255, 85, 85, 85),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "키: " +
                                              eventList[index]
                                                  .user
                                                  .height
                                                  .toString() +
                                              "cm",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                            color:
                                                Color.fromARGB(255, 85, 85, 85),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "몸무게: " +
                                              eventList[index]
                                                  .user
                                                  .weight
                                                  .toString() +
                                              "kg",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                            color:
                                                Color.fromARGB(255, 85, 85, 85),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "경력: " +
                                              eventList[index].user.history,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                            color:
                                                Color.fromARGB(255, 85, 85, 85),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "위치: " + eventList[index].location,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                            color:
                                                Color.fromARGB(255, 85, 85, 85),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "장소명: " +
                                              eventList[index].locationName,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                            color:
                                                Color.fromARGB(255, 85, 85, 85),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "메시지: " + eventList[index].message,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                            color:
                                                Color.fromARGB(255, 85, 85, 85),
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("확인"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
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
