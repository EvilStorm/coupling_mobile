import 'package:intl/intl.dart';

class AboutDate {
  final dateFormat = DateFormat('yyyy-MM-dd');
  final dateFormatMMdd = DateFormat('yyyy\nMM/dd');
  final dateFormatMd = DateFormat('MM/dd');

  static final AboutDate _singleton = AboutDate._internal();

  factory AboutDate() {
    return _singleton;
  }

  AboutDate._internal();
}
