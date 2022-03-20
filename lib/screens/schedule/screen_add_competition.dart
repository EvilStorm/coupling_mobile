import 'package:coupling/constants/constants.dart';
import 'package:coupling/screens/common/map.dart';
import 'package:coupling/screens/make_profile/widgets/basic_info_row_wapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCompetitionScreen extends StatefulWidget {
  const AddCompetitionScreen({Key? key}) : super(key: key);

  @override
  State<AddCompetitionScreen> createState() => _AddCompetitionScreenState();
}

class _AddCompetitionScreenState extends State<AddCompetitionScreen> {
  bool _showMap = false;

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
      body: Stack(
        children: [
          SingleChildScrollView(
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
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showMap = true;
                        });
                      },
                      child: Text('위치'),
                    ),
                    space: 2,
                  ),
                  BasicInfoItemWidget(
                    title: '장소',
                    child: TextField(),
                    space: 2,
                  ),
                  BasicInfoItemWidget(
                    title: '시간',
                    child: TextField(),
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
          Visibility(visible: _showMap, child: Center(child: MapForGoogle()))
        ],
      ),
    );
  }
}
