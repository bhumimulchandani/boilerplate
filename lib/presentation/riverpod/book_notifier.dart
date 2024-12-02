// import 'package:boilerplate/data/repositories/book_repository.dart';
// import 'package:flutter/material.dart';

// class BookProvider extends ChangeNotifier {
//   final BookRepository _bookRepository = BookRepository();

//   bool _isLoading = false;
//   Map<String, dynamic>? _bookDetails;
//   String? _error;

//   bool get isLoading => _isLoading;
//   Map<String, dynamic>? get bookDetails => _bookDetails;
//   String? get error => _error;

//   Future<void> fetchBookDetails(String isbn) async {
//     _isLoading = true;
//     _error = null;
//     _bookDetails = null;
//     notifyListeners();

//     try {
//       final data = await _bookRepository.repoGetBookDetails(isbn);
//       if (data.containsKey('error')) {
//         _error = data['error'];
//       } else {
//         _bookDetails = data;
//       }
//     } catch (e) {
//       _error = "An unexpected error occurred.";
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }

import 'package:boilerplate/domain/controller/book_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookState {
  final bool isLoading;
  final Map<String, dynamic>? bookDetails;
  final String? error;

  BookState({this.isLoading = false, this.bookDetails, this.error});

  BookState copyWith({
    bool? isLoading,
    Map<String, dynamic>? bookDetails,
    String? error,
  }) {
    return BookState(
      isLoading: isLoading ?? this.isLoading,
      bookDetails: bookDetails ?? this.bookDetails,
      error: error ?? this.error,
    );
  }
}

class BookNotifier extends StateNotifier<BookState> {
  final BookController _bookController;

  BookNotifier(this._bookController) : super(BookState());

  Future<void> fetchBookDetails(String isbn) async {
    state = state.copyWith(isLoading: true, error: null, bookDetails: null);

    try {
      final bookData = await _bookController.getBookDetails(isbn);
      if (bookData.containsKey('error')) {
        state = state.copyWith(error: bookData['error'], isLoading: false);
      } else {
        state = state.copyWith(bookDetails: bookData, isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(
        error: 'An unexpected error occurred.',
        isLoading: false,
      );
    }
  }
}

final bookProvider = StateNotifierProvider<BookNotifier, BookState>((ref) {
  return BookNotifier(BookController());
});
