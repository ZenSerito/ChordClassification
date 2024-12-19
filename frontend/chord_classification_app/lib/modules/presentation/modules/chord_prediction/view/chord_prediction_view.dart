import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/extensions/extensions.dart';
import '../../../../../core/services/get.dart';
import '../../../widgets/audio_players/audio_player.dart';
import '../../../widgets/buttons/app_buttons.dart';
import '../../../widgets/progressindicators/app_progress_indicators.dart';
import '../providers/chord_prediction_provider.dart';
import '../providers/music_notifier_provider.dart';
import 'graph_view.dart';

class ChordPredictionView extends ConsumerWidget {
  const ChordPredictionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioFile = ref.watch(musicFileProvider);
    final chordPrediction = ref.watch(chordPredictionProvider(audioFile!));
    return ListView(
        shrinkWrap: true,
        padding: 10.allPad,
        physics: Get.scrollPhysics,
        children: [
          AudioPlayer(key: Get.key(audioFile), file: audioFile),
          10.verticalGap,
          chordPrediction.when(
              skipLoadingOnRefresh: false,
              error: (error, stackTrace) => AppButton(
                  onTap: () => ref.invalidate(chordPredictionProvider),
                  text: "Reload"),
              loading: () => Center(child: AppProgressIndicator()),
              data: (predictions) {
                return GraphView(predictions);
              })
        ]);
  }
}
