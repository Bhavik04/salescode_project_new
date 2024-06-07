abstract class DatabaseService {
  Future<void> init([String env = "prod", int attemptNumber = 1]);
  dynamic getStore<T>([String boxName]);
  void clearOldStoreCache();
  void closeStore();
  void setStore(dynamic store);
  // Future clearBox<T>(String dbName, {Box<T>? boxInstance});
  Future<void> deleteAllDatabases();
}
