import 'package:http_interceptor/http_interceptor.dart';
import 'package:intl/intl.dart';

import '../utils/print_log.dart';

class HttpLoggerInterceptor implements InterceptorContract {
  DateFormat dateFormat = DateFormat('HH:mm:ss.sss');
  bool isShowLog = true;

  String getTime() {
    return dateFormat.format(DateTime.now());
  }

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    if (isShowLog) {
      String msg = '''
        <<<<<<<<<<<<<<  Request  >>>>>>>>>>>>>>>>>>>>>>>
        Request Url: ${data.url}
        Request header: ${data.headers}
        Request Body: ${data.body}
        --------------------------------------''';
      Log.w(msg);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if (isShowLog) {
      String msg = '''
        >>>>>>>>>>>>>>>>>> Response <<<<<<<<<<<<<<<<<<<<<<<<
        Response Url: (${data.statusCode}) ${data.url}
        Response data: ${data.body.toString()}
        --------------------------------------''';

      Log.w(msg);
    }

    return data;
  }
}
