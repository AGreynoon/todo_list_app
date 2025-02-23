import 'package:flutter_riverpod/flutter_riverpod.dart';

class PagesNotifier extends StateNotifier<int> {
  PagesNotifier() : super(0);

  void setIndex(int newIndex) {
    state = newIndex;
  }
}

final pagesNotifierProvider =
    StateNotifierProvider<PagesNotifier, int>((ref) => PagesNotifier());
