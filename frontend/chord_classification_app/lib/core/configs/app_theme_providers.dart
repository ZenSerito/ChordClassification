import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider extends ChangeNotifier {
  final _themes = [ThemeMode.light, ThemeMode.dark, ThemeMode.system];
  ThemeMode? themeMode;
  int index;
  Ref ref;
  ThemeProvider({required this.index, required this.ref}) {
    themeMode = _themes[index];
  }

  void toggleTheme(int ind) async {
    index = ind;
    themeMode = _themes[index];
    notifyListeners();
  }
}

final themeMode = ChangeNotifierProvider<ThemeProvider>(
    (ref) => ThemeProvider(index: 0, ref: ref));
