import 'package:coupling/constants/constants.dart';
import 'package:coupling/contollers/contoller_competition.dart';
import 'package:coupling/contollers/controller_map_search.dart';
import 'package:coupling/models/model_map_address.dart';
import 'package:coupling/screens/common/google_map.dart';
import 'package:coupling/screens/make_profile/widgets/basic_info_row_wapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class AddCompetitionScreen extends StatefulWidget {
  const AddCompetitionScreen({Key? key}) : super(key: key);

  @override
  State<AddCompetitionScreen> createState() => _AddCompetitionScreenState();
}

class _AddCompetitionScreenState extends State<AddCompetitionScreen> {
  CompetitionController _competitionController = Get.find();
  MapSearchController _mapSearchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          '한판붙자',
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.sapceGap),
          child: Column(
            children: [
              BasicInfoItemWidget(
                title: '제목',
                child: TextField(),
                space: 2,
              ),
              BasicInfoItemWidget(
                title: '위치',
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () => Get.toNamed("/showMap"),
                      child: const Text('위치'),
                    ),
                    Visibility(
                        child: Text(
                      "${_mapSearchController.selectedAddress.value.formattedAddress}",
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
                  ],
                ),
                space: 2,
              ),
              const SizedBox(
                height: Constants.sapceGap,
              ),
              BasicInfoItemWidget(
                title: '장소',
                child: GestureDetector(
                  onTap: () => Get.toNamed("/showMap"),
                  child: Text(
                    _mapSearchController.searchWord ?? "",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                space: 2,
              ),
              const SizedBox(
                height: Constants.sapceGap,
              ),
              BasicInfoItemWidget(
                title: '시간',
                child: GestureDetector(
                  onTap: () {
                    Future<DateTime?> selectedDate = showDatePicker(
                      context: context,
                      initialDate: DateTime.now(), //초기값
                      firstDate: DateTime(2020), //시작일
                      lastDate: DateTime(2022), //마지막일
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: ThemeData.dark(), //다크 테마
                          child: child!,
                        );
                      },
                    );
                  },
                  child: Text(
                    '죽기 좋은 날',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                space: 2,
              ),
              BasicInfoItemWidget(
                title: '전할 말',
                child: TextField(),
                space: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
