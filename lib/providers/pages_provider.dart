import 'package:flutter/material.dart';

class PagesProvider extends ChangeNotifier {
  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  void updatePage(int newIndex) {
    _currentPageIndex = newIndex;
    notifyListeners();
  }
}
