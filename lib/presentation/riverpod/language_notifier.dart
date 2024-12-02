import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class LanguageNotifier extends StateNotifier<Locale?> {
  LanguageNotifier() : super(const Locale('en'));

  void changeLanguage(String languageCode) {
    state = Locale(languageCode);
  }
}

final languageNotifierProvider =
    StateNotifierProvider<LanguageNotifier, Locale?>((ref) {
  return LanguageNotifier();
});
