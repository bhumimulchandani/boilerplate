abstract class PinRepositoryAbstract {
  Future<void> saveSecureData(String key,String value);
  Future<void> getSecureData(String key);
}