import 'package:dio/dio.dart';
import 'package:monitorflutter/app/data/model/log_notification.dart';
import 'package:monitorflutter/app/data/provider/endpoint_provider.dart';
import 'package:monitorflutter/app/data/provider/log_notification_provider.dart';
import 'package:monitorflutter/app/data/repository/log_notification_repository.dart';

class LogNotificationRepository implements ILogNotificationRepository {
  LogNotificationRepository({required this.provider});
  final ILogNotificationProvider provider;

  @override
  getAll() async {
    try {
      final Response response = await provider.getAll();
      if (response.statusCode == 200) {
        return LogNotification.fromJson(response.data);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  @override
  getById(Map data) async {
    final response = await provider.getById(data);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
  }
}
