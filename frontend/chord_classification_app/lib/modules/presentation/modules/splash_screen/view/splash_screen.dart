import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/extensions/extensions.dart';

import '../../../../../core/services/get.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../widgets/text/app_name.dart';
import '../../homepage/views/homepage.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool hasSwitched = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(3.seconds, (_) {
      if (hasSwitched) {
        Get.offAll(const Homepage());
      }
      hasSwitched = !hasSwitched;
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const text = AppName(fontsize: 45);
    return PlatformScaffold(
      backgroundColor: CupertinoColors.systemGrey5,
      body: Padding(
        padding: const EdgeInsets.all(8.0).rt,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: 1.seconds,
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: hasSwitched
                  ? const Center(child: text)
                  : Image.asset(Assets.images.splashImage),
            ),
          ],
        ),
      ),
    );
  }
}
