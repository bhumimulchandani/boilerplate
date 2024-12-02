// import 'package:boilerplate/core/utils/network_utils.dart';
// import 'package:boilerplate/core/utils/logutils.dart';

// class BookDatasource {
//   final NetworkUtils networkUtils = NetworkUtils();

//   Future<Map<String, dynamic>> getBookDetails(String isbn) async {
//     try {
//       final url = NetworkUtils.buildUrl(isbn);

//       LogUtils.logDebug("Query URL: $url");
      

//       final response = await networkUtils.get(url);
//       print("Response Data: ${response.data}");

//       if (response.statusCode == 200 && response.data['totalItems'] > 0) {
//         LogUtils.logInfo("Book details fetched successfully.");
//         final bookData = response.data['items'][0]['volumeInfo'];
//         return {
//           'title': bookData['title'],
//           'authors': (bookData['authors'] as List).join(', '),
//           'description': bookData['description'] ?? 'No description available',
//           'thumbnail':
//               bookData['imageLinks']?['thumbnail'] ?? 'No image available',
//         };
//       } else if (response.statusCode == 200 &&
//           response.data['totalItems'] == 0) {
//         LogUtils.logInfo("No books found for the given ISBN.");
//         return {"error": "No books found"};
//       } else {
//         LogUtils.logError(
//             "Failed to fetch book details: ${response.statusCode}");
//         return {"error": "API error with status code: ${response.statusCode}"};
//       }
//     } catch (e) {
//       LogUtils.logError("Error occurred while fetching book details: $e");
//       return {"error": "An unexpected error occurred"};
//     }
//   }
// }

import 'package:boilerplate/core/utils/network_utils.dart';
import 'package:boilerplate/core/utils/logutils.dart';

class BookDatasource {
  final NetworkUtils networkUtils = NetworkUtils();

  Future<Map<String, dynamic>> getBookDetails(String isbn) async {
    try {
      final url = NetworkUtils.buildUrl(isbn);

      LogUtils.logDebug("Query URL: $url");

      final response = await networkUtils.get(url);
      print("Response Data: ${response.data}");

      if (response.statusCode == 200 && response.data['totalItems'] > 0) {
        LogUtils.logInfo("Book details fetched successfully.");
        final bookData = response.data['items'][0]['volumeInfo'];
        return {
          'title': bookData['title'],
          'authors': (bookData['authors'] as List).join(', '),
          'description': bookData['description'] ?? 'No description available',
          'thumbnail':
              bookData['imageLinks']?['thumbnail'] ?? 'No image available',
        };
      } else if (response.statusCode == 200 &&
          response.data['totalItems'] == 0) {
        LogUtils.logInfo("No books found for the given ISBN.");
        return {"error": "No books found"};
      } else {
        LogUtils.logError(
            "Failed to fetch book details: ${response.statusCode}");
        return {"error": "API error with status code: ${response.statusCode}"};
      }
    } catch (e) {
      LogUtils.logError("Error occurred while fetching book details: $e");
      return {"error": "An unexpected error occurred"};
    }
  }
}

