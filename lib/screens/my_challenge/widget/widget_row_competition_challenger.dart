import 'package:coupling/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../models/model_competition_detail.dart';

class RowCompetitionChallenger extends StatelessWidget {
  final int? opponentId;
  final Challengers challenger;
  final Function selectedChallenger;

  const RowCompetitionChallenger({
    Key? key,
    required this.opponentId,
    required this.challenger,
    required this.selectedChallenger,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedBackgroundColor:
          opponentId == (challenger.id ?? 0) ? Colors.red : Colors.white,
      backgroundColor:
          opponentId == (challenger.id ?? 0) ? Colors.red : Colors.white,
      trailing: const SizedBox.shrink(),
      title: Row(
        children: [
          Visibility(
            visible: opponentId == challenger.id,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, Constants.sapceGap, 0),
              child: Image.asset('assets/images/vs_t.png', width: 35),
            ),
          ),
          SizedBox(
            width: 35,
            height: 35,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 30,
              child: const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/noperson.png',
                ),
                radius: 29,
              ),
            ),
          ),
          const SizedBox(
            width: Constants.sapceGap / 2,
          ),
          Text(
            challenger.user?.nickName ?? "none",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const Spacer(),
          Visibility(
            visible: opponentId == null,
            child: ElevatedButton(
              onPressed: () {
                selectedChallenger.call(challenger.id);
              },
              child: const Text('선택'),
            ),
          ),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Constants.sapceGap),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '${challenger.user?.age}세',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    width: Constants.sapceGap / 4,
                  ),
                  Text(
                    '${challenger.user?.height}cm',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    width: Constants.sapceGap / 4,
                  ),
                  Text(
                    '${challenger.user?.weight}kg',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    width: Constants.sapceGap / 4,
                  ),
                  Text(
                    challenger.user?.gender == 0 ? '여자' : '남자',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(Constants.sapceGap / 2),
                child: Row(
                  children: [
                    Text(
                      '경력 ',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    const SizedBox(
                      width: Constants.sapceGap,
                    ),
                    Text("${challenger.user?.history}"),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
