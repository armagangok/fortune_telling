abstract class StorageContract {
  Future<void> write<T>(String key, T dataToSave);
  Future<T> read<T>(String key);
  Future<void> delete<T>(String key);
}
