import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_core/core.dart';

final pageControllerProvider = Provider.autoDispose((ref) {
  final controller = PageController();
  ref.onDispose(() => controller.dispose);
  return controller;
});

final textController = Provider.autoDispose.family((ref, _) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose);
  return controller;
});

final noDiposeTextControllers = Provider.family((ref, _) {
  final controller = TextEditingController();
  ref.onDispose(() => controller.dispose);
  return controller;
});

final rangeControllerProvider =
    StateProvider.autoDispose((ref) => RangeController(start: 0, end: 8));
