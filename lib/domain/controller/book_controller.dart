// import 'package:boilerplate/data/repositories/book_repository.dart';

// class BookController {
//   final BookRepository bookRepo = BookRepository();
//   Map<String, dynamic> bookDetails = {};

//   Future<Map<String, dynamic>> getBookDetails(String isbn) async {
//     bookDetails = await bookRepo.repoGetBookDetails(isbn);
//     return bookDetails;
//   }
// }

import 'package:boilerplate/data/repositories/book_repository.dart';

class BookController {
  final BookRepository _bookRepository = BookRepository();

  Future<Map<String, dynamic>> getBookDetails(String isbn) async {
    return await _bookRepository.repoGetBookDetails(isbn);
  }
}
