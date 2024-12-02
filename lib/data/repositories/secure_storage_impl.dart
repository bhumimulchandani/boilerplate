import 'package:boilerplate/domain/repositories/pin_repo_abstract.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage implements PinRepositoryAbstract {
  final secureStorage = const FlutterSecureStorage();

  @override
  Future<String?> getSecureData(String key) async {
    return secureStorage.read(key: key);
  }

  @override
  Future<void> saveSecureData(String key, String value) async {
    await secureStorage.write(key: value, value: value);
  }

  Future<String?> readJwtToken() async {
    return await secureStorage.read(key: "jwt_token");
  }

  Future<void> saveJwtToken(String token, String expiry, String route,
      String jid, String entitlements) async {
    await secureStorage.write(key: "jwt_token", value: token);
    await secureStorage.write(key: "expiry", value: expiry);
    await secureStorage.write(key: "route", value: route);
    await secureStorage.write(key: "jid", value: jid);
    await secureStorage.write(key: "entitlements", value: entitlements);
    print("Token Saved Successfully!");
  }
}
