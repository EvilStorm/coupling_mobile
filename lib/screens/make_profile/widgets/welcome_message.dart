import 'package:flutter/material.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '안녕하세요.\n\n\n',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          TextSpan(
            text: '스파링 클럽입니다',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          TextSpan(
            text: '나와 함께 겨룰 수 있는 상대방을 쉽게 찾아줍니다.',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TextSpan(
            text: ' 가치관',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          TextSpan(
            text: '이 맞는지 확인 해봅시다.\n\n',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TextSpan(
            text: '뭣이 중헌데',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          TextSpan(
            text: '는 ',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TextSpan(
            text: '나만의 질문',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          TextSpan(
            text:
                '을 만들고, 답을 보고 나와 맞는지 확인하고 매칭 여부를 선택하는 시스템입니다.\n\n앱을 통한 상대방 얼굴 확인은 ',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TextSpan(
            text: '불가능',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          TextSpan(
            text: '합니다. \n우리 이젠 알잖아요? 그 사람 아니라는거\n\n',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TextSpan(
            text: '거짓',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          TextSpan(
            text: '으로 답 한다면 ',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TextSpan(
            text: '나와 맞는 짝을',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          TextSpan(
            text: ' 찾지 못하고 시간낭비라는거 아시죠?\n\n\n',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TextSpan(
            text: '매칭에 성공하면 서로의 ',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TextSpan(
            text: '전화번호',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          TextSpan(
            text: '가 공개됩니다.\n질문과 답이 얼마나 신중해야 하는지 아시겠죠??\n\n\n',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TextSpan(
            text: '당당히 나를 표현 하자고요!',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
