import 'package:boilerplate/data/repositories/book_repositories.dart';
import 'package:flutter/material.dart';

class BookProvider extends ChangeNotifier {
  final BookRepository _bookRepository = BookRepository();

  bool _isLoading = false;
  Map<String, dynamic>? _bookDetails;
  String? _error;

  bool get isLoading => _isLoading;
  Map<String, dynamic>? get bookDetails => _bookDetails;
  String? get error => _error;

  Future<void> fetchBookDetails(String isbn) async {
    _isLoading = true;
    _error = null;
    _bookDetails = null;
    notifyListeners();

    try {
      final data = await _bookRepository.repoGetBookDetails(isbn);
      if (data.containsKey('error')) {
        _error = data['error'];
      } else {
        _bookDetails = data;
      }
    } catch (e) {
      _error = "An unexpected error occurred.";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
