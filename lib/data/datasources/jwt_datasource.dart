import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class JwtDatasource {

  Future<Map<String, dynamic>> getJwtData(String email, String password) async {
    try {
      final response = await Dio().getUri(
        Uri.parse(dotenv.env['BaseUrl']!),
        options: Options(contentType: 'application/json'),
      );

      if (response.statusCode == 200) {
        return {
          "success": true,
          "token":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGFpbXMiOnsiYXBwcyI6bnVsbCwiZW1zX3JvbGVzIjpbXX0sImlhdCI6MTczMTA0ODA4MCwiZXhwIjoxNzMxMTM0NDgwLCJhdWQiOiJDb2dlbmNpc1VzZXIiLCJpc3MiOiJDb2dlbmNpcyJ9.tjG0RdXivQVhpoECikqpVqskctVKUnGDetIGVPdk4Tc",
          "expiry": "2024-11-09T06:41:20.000Z",
          "expiryInSeconds": 1731134480000,
          "route": "newsbrief",
          "queryParams": {},
          "jid": null,
          "entitlements": null,
          "ems_roles": []
        };
      } else {
        log("API Response Status Code: ${response.statusCode}");
        return {};
      }
    } catch (e) {
      // log(AppErrors.networkError);
      return {};
    }
  }
}
