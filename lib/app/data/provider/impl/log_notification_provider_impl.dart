import 'package:monitorflutter/app/data/provider/endpoint_provider.dart';
import 'package:monitorflutter/app/data/provider/log_notification_provider.dart';

const baseUrl = 'http://103.57.222.93:8082/api/lognotification';

class LogNotificationProvider implements ILogNotificationProvider{
  final EndpointProvider _endpointProvider = EndpointProvider();

  @override
  getAll() {
    return _endpointProvider.connectApi().post("$baseUrl/list?from=01-01-2021&to=31-12-2031");
  }

  @override
  getById(Map data) {
    return _endpointProvider.connectApi().post("$baseUrl/find", data: data);
  }

  @override
  save(Map data) {
    return _endpointProvider.connectApi().post("$baseUrl/create", data: data);
  }

  @override
  update(Map data) {
    return _endpointProvider.connectApi().post("$baseUrl/update", data: data);
  }

  @override
  remove(Map data) {
    return _endpointProvider.connectApi().post("$baseUrl/delete", data: data);
  }
}