abstract class ILogNotificationRepository {
  getAll();
  getById(Map data);
  save(Map data);
  update(Map data);
  remove(Map data);
}