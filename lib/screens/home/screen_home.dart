import 'package:coupling/contollers/controller_sign.dart';
import 'package:coupling/screens/my_challenge/screen_my_challenge.dart';
import 'package:coupling/screens/profile/screen_profile.dart';
import 'package:coupling/screens/schedule/screen_schedule.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final SignController _signController = Get.find();
  @override
  void initState() {
    super.initState();
    _signController.silentSignIn();
  }

  void _tabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '스파링 클럽',
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.white),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          ScheduleScreen(),
          MyChallengeScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _tabChange,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
