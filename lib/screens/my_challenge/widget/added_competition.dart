import 'package:coupling/contollers/controller_my_challenge.dart';
import 'package:coupling/screens/my_challenge/widget/widget_row_my_competition.dart';
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
    return Obx(
      () => _myChallengeController.competitionList.isEmpty
          ? const Center(
              child: Text('내 스파링 상대를 찾아봐요! 빠이팅'),
            )
          : Expanded(
              child: ListView.builder(
                itemCount: _myChallengeController.competitionList.length,
                itemBuilder: (context, index) => RowMyCompetition(
                  competition: _myChallengeController.competitionList[index],
                ),
              ),
            ),
      // : Container(
      //     child: Column(
      //       children: [
      //         ..._myChallengeController.competitionList.map(
      //           (competition) => RowMyCompetition(
      //             competition: competition,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
    );
  }
}
