import 'package:boilerplate/data/repositories/secure_storage_impl.dart';
import 'package:boilerplate/domain/controller/jwt_controller.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio dio = Dio(); // Initialize the Dio instance
  final _storage =
      SecureStorage(); // Secure storage for reading and writing tokens
  final jwtController = JwtController();

  DioClient() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {

          // Add the Authorization header with token to each request

          if (await jwtController.isJwtTokenValid()) {
            String? token = await _storage.readJwtToken();
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }

            return handler
                .next(options); // Pass the request to the next interceptor
          }
        },
        onResponse: (response, handler) {
          return handler
              .next(response); // Pass the response to the next handler
        },
        onError: (error, handler) async {
          // Handle token refresh on 401 error
          if (error.response?.statusCode == 401) {
            try {
              final newToken = await _refreshToken();
              if (newToken != null) {
                await _storage.saveSecureData('jwt_token', newToken);
                error.requestOptions.headers['Authorization'] =
                    'Bearer $newToken';
                final response =
                    await dio.fetch(error.requestOptions); // Retry the request
                return handler.resolve(response); // Resolve with the response
              }
            } catch (e) {
              return handler.reject(error); // Reject if token refresh fails
            }
          }
          return handler.next(error); // Continue with the error if not a 401
        },
      ),
    );
  }

  // Simulate a token refresh logic
  Future<String?> _refreshToken() async {
    return 'new_token';
  }
}