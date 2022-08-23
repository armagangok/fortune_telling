import 'package:get_storage/get_storage.dart';

class MyStorage {


  final GetStorage _getStorageInstance = GetStorage();

  GetStorage get storage => _getStorageInstance;
}
