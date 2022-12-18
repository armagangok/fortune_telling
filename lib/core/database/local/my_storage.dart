import 'package:get_storage/get_storage.dart';

import 'contract/storage_contract.dart';

class StorageImp implements StorageContract {
  StorageImp._();
  static final instance = StorageImp._();

  final GetStorage _storage = GetStorage();

  @override
  Future<T> read<T>(String key) async {
    var response = await _storage.read(key);
    return response;
  }

  @override
  Future<void> remove<T>(String key) async {
    await _storage.remove(key);
  }

  @override
  Future<void> write<T>(String key, T dataToSave) async {
    await _storage.write(key, dataToSave);
  }
}
