import 'package:monitorflutter/app/data/provider/endpoint_provider.dart';
import 'package:monitorflutter/app/data/provider/log_notification_provider.dart';
import 'package:monitorflutter/app/utils/global_variables.dart';

const baseUrl = CONSTANT.URL_API;

class LogNotificationProvider implements ILogNotificationProvider {
  final EndpointProvider _endpointProvider = EndpointProvider();

  @override
  getAll() {
    return _endpointProvider
        .connectApi()
        .post("$baseUrl/list?from=01-01-2021&to=31-12-2031");
  }

  @override
  getById(Map data) {
    return _endpointProvider.connectApi().post("$baseUrl/find", data: data);
  }
}
