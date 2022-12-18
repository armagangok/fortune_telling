abstract class NavigationServiceContract {
  Future<void> navigateTo({required String path, Object? data});
  Future<void> navigaToClear({required String path, Object? data});
}
