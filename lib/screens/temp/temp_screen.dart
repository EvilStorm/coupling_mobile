import 'package:coupling/screens/profile/screen_profile.dart';
import 'package:coupling/screens/schedule/screen_schedule.dart';
import 'package:coupling/screens/temp/profile/screen_temp_profile.dart';
import 'package:coupling/screens/temp/schedule/screen_temp_schedule.dart';
import 'package:flutter/material.dart';

class TempScreen extends StatefulWidget {
  const TempScreen({Key? key}) : super(key: key);

  @override
  State<TempScreen> createState() => _TempScreenState();
}

class _TempScreenState extends State<TempScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(
                child: Text(
                  '스케줄',
                  style: Theme.of(context).textTheme.bodyText1!,
                ),
              ),
              Tab(
                child: Text(
                  '내정보',
                  style: Theme.of(context).textTheme.bodyText1!,
                ),
              ),
            ],
          ),
          const Expanded(
            child: TabBarView(
              children: [TempScheduleScreen(), TempProfileScreen()],
            ),
          ),
        ],
      ),
    );
  }
}
