import 'package:coupling/constants/constants.dart';
import 'package:coupling/contollers/contoller_competition.dart';
import 'package:coupling/contollers/controller_map_search.dart';
import 'package:coupling/models/model_map_address.dart';
import 'package:coupling/screens/common/google_map.dart';
import 'package:coupling/screens/make_profile/widgets/basic_info_row_wapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../utils/print_log.dart';

class AddCompetitionScreen extends StatefulWidget {
  const AddCompetitionScreen({Key? key}) : super(key: key);

  @override
  State<AddCompetitionScreen> createState() => _AddCompetitionScreenState();
}

class _AddCompetitionScreenState extends State<AddCompetitionScreen> {
  CompetitionController _competitionController = Get.find();
  MapSearchController _mapSearchController = Get.find();

  DateTime? _selectedTime;
  DateFormat formattedDate = DateFormat('yyyy-MM-dd kk:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'ννλΆμ',
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _competitionController.locationName =
                  _mapSearchController.searchWord;
              _competitionController.location =
                  _mapSearchController.selectedAddress.value;

              _competitionController.addCompetition();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.sapceGap),
          child: Obx(
            () => Column(
              children: [
                const SizedBox(
                  height: Constants.sapceGap * 2,
                ),
                BasicInfoItemWidget(
                  title: 'μ λͺ©',
                  child: TextField(
                    controller: _competitionController.titleController,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  space: 2,
                ),
                const SizedBox(
                  height: Constants.sapceGap,
                ),
                BasicInfoItemWidget(
                  title: 'μμΉ',
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () => Get.toNamed("/showMap"),
                        child: const Text('μμΉ'),
                      ),
                      Visibility(
                          visible: _mapSearchController
                                  .selectedAddress.value.formattedAddress !=
                              null,
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
                  title: 'μ₯μ',
                  child: GestureDetector(
                    onTap: () => Get.toNamed("/showMap"),
                    child: Text(
                      _mapSearchController.searchWord ?? "μ₯μ μ ν",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  space: 2,
                ),
                const SizedBox(
                  height: Constants.sapceGap,
                ),
                BasicInfoItemWidget(
                  title: 'μκ°',
                  child: GestureDetector(
                    onTap: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(), //μ΄κΈ°κ°
                        firstDate: DateTime.now(), //μμμΌ
                        lastDate: DateTime(2023), //λ§μ§λ§μΌ
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light(), //λ€ν¬ νλ§
                            child: child!,
                          );
                        },
                      );
                      if (selectedDate == null) {
                        return;
                      }
                      Log.i("Result: ${selectedDate.toString()}");
                      TimeOfDay? selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (selectedTime == null) {
                        return;
                      }
                      DateTime time = DateTime(
                          selectedDate.year,
                          selectedDate.month,
                          selectedDate.day,
                          selectedTime.hour,
                          selectedTime.minute);
                      _competitionController.date = time;
                      setState(() {
                        _selectedTime = time;
                      });
                      Log.i("DaTE: `${time.toString()}");
                    },
                    child: Text(
                      _selectedTime == null
                          ? 'μ£½κΈ° μ’μ λ  μ ν'
                          : formattedDate.format(_selectedTime!),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  space: 2,
                ),
                const SizedBox(
                  height: Constants.sapceGap,
                ),
                BasicInfoItemWidget(
                  title: 'μ ν  λ§',
                  child: TextField(
                    controller: _competitionController.messageController,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  space: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
