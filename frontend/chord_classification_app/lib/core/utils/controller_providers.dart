import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageControllerProvider = Provider.autoDispose((ref) {
  final controller = PageController();
  ref.onDispose(() => controller.dispose);
  return controller;
});
