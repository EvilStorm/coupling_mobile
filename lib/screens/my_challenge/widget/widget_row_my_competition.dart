import 'package:coupling/screens/my_challenge/widget/widget_row_competition_challenger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../contollers/controller_my_challenge.dart';
import '../../../models/model_competition_detail.dart';
import '../../../utils/print_log.dart';
import '../../common/about_date.dart';

class RowMyCompetition extends StatelessWidget {
  final MyChallengeController _myChallengeController = Get.find();

  final CompetitionDetailModel competition;
  RowMyCompetition({
    Key? key,
    required this.competition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: Constants.sapceGap / 2),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Visibility(
                  visible: competition.opponentId != null,
                  child: Image.asset('assets/images/vs_t.png',
                      color: const Color.fromRGBO(255, 255, 255, 0.5),
                      width: 60,
                      colorBlendMode: BlendMode.modulate),
                ),
                Text(
                  AboutDate.dateFormatMd
                      .format(competition.matchTime ?? DateTime.now()),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
            const SizedBox(
              width: Constants.sapceGap,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 230,
                  child: Text(
                    competition.title ?? "none",
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: Constants.sapceGap / 4,
                ),
                Text(
                  competition.locationName ?? "none",
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          ],
        ),
      ),
      children: [
        Visibility(
          visible: competition.opponentId == null,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '아직 도전자가 결정되지 않았습니다.',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
        ),
        ...competition.challengers!
            .map((challenger) => RowCompetitionChallenger(
                opponentId: competition.opponentId,
                challenger: challenger,
                selectedChallenger: (challengerId) {
                  _myChallengeController.selectChallenger(
                      competition.id!, challengerId);
                })),
      ],
    );
  }
}
