import 'package:get_storage/get_storage.dart';

class MyStorage {
  MyStorage._();
  static final instance = MyStorage._();

  final GetStorage _getStorageInstance = GetStorage();

  GetStorage get storage => _getStorageInstance;
}
