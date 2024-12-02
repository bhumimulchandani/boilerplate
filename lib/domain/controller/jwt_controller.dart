import 'package:boilerplate/data/datasources/jwt_datasource.dart';
import 'package:boilerplate/data/repositories/secure_storage_impl.dart';
import 'package:flutter/material.dart';

class JwtController {
  final jwtDatasource = JwtDatasource();
  final secureStorage = SecureStorage();

  Future<void> authenticateAndSaveJwt(
      String email, String password, BuildContext context) async {
    Map<String, dynamic> response =
        await jwtDatasource.getJwtData(email, password);

    if (response.isNotEmpty) {
      secureStorage.saveJwtToken(
        response["token"] ?? "",
        response["expiry"] ?? "",
        response["route"] ?? "",
        response["jit"] ?? "",
        response["entitlements"] ?? "",
      );
    }
  }

  Future<bool> isJwtTokenValid() async {
    String? expiryDate = await secureStorage.getSecureData("expiry");
    String ;
    if (expiryDate != null) {
      DateTime expiry = DateTime.parse(expiryDate);
      return DateTime.now().isBefore(expiry);
    }
    return false;
  }

  Future<String?> retrieveJwtToken() async {
    return secureStorage.readJwtToken();
  }
}
