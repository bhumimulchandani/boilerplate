import 'package:boilerplate/data/datasources/book_datasources.dart';

class BookRepository {
  final BookDatasource bookDatasource = BookDatasource();

  Future<Map<String, dynamic>> repoGetBookDetails(String isbn) async {
    return await bookDatasource.getBookDetails(isbn);
  }
}
