import 'package:coupling/contollers/controller_my_challenge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddedCompetition extends StatefulWidget {
  const AddedCompetition({Key? key}) : super(key: key);

  @override
  State<AddedCompetition> createState() => _AddedCompetitionState();
}

class _AddedCompetitionState extends State<AddedCompetition> {
  MyChallengeController _myChallengeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return _myChallengeController.competitionList.isEmpty
        ? const Center(
            child: Text('내 스파링 상대를 찾아봐요! 빠이팅'),
          )
        : Container(
            child: Column(
              children: [
                ExpansionTile(
                  title: Text(
                    _myChallengeController.competitionList.elementAt(0).title ??
                        "none",
                  ),
                  children: [],
                ),
              ],
            ),
          );
  }
}
