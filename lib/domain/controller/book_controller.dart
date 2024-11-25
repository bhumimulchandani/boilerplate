import 'package:boilerplate/data/repositories/book_repositories.dart';

class BookController {
  final BookRepository bookRepo = BookRepository();
  Map<String, dynamic> bookDetails = {};

  Future<Map<String, dynamic>> getBookDetails(String isbn) async {
    bookDetails = await bookRepo.repoGetBookDetails(isbn);
    return bookDetails;
  }
}
