import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_core/core.dart';

import '../../../../core/configs/app_colors.dart';
import '../../../../core/constants/chord_map.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/services/file_handlers/file_handler.dart';
import '../../../../core/services/get.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/controller_providers.dart';
import '../../../injection_container.dart';
import '../../modules/chord_prediction/providers/music_notifier_provider.dart';
import '../buttons/icon_buttons.dart';
import '../text/app_text.dart';

class AudioPlayer extends ConsumerStatefulWidget {
  const AudioPlayer({super.key, required this.file});

  final File file;

  @override
  ConsumerState<AudioPlayer> createState() => _AudioPlayerState();
}

class _AudioPlayerState extends ConsumerState<AudioPlayer> {
  final playerController = PlayerController();
  bool isPlaying = false;

  final chordValue = ValueNotifier('');
  final colorNotifier = ValueNotifier(AppColors.primary);

  @override
  void initState() {
    super.initState();
    playerController.preparePlayer(path: widget.file.path);
    playerController.setFinishMode(finishMode: FinishMode.pause);
    playerController.onCompletion.listen((_) {
      playerController.seekTo(0);
      isPlaying = false;
      chordValue.value = '';
      setState(() {});
    });
    playerController.onCurrentDurationChanged.listen((sec) {
      updateChord(sec);
    });
  }

  updateChord(int currentDuration) {
    final chordPredictions = ref.read(predictedDataProvider);
    int start = currentDuration ~/ 1000;
    ref
        .read(rangeControllerProvider.notifier)
        .update((prevState) => RangeController(start: start, end: start + 6));
    for (var prediction in chordPredictions) {
      if (currentDuration >= prediction.start * 1000 &&
          currentDuration < prediction.end * 1000) {
        chordValue.value =
            '${prediction.chord} (${prediction.start}-${prediction.end}) sec';
        colorNotifier.value =
            chordToColor[prediction.chord] ?? AppColors.titleColor;
        break;
      }
    }
  }

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 10.ht,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppIcon(isPlaying ? AppIcons.pause : AppIcons.play, onTap: () {
              if (isPlaying) {
                playerController.pausePlayer();
                isPlaying = false;
              } else {
                playerController.startPlayer();
                isPlaying = true;
              }
              setState(() {});
            }, color: Get.disabledColor),
            ValueListenableBuilder(
              valueListenable: colorNotifier,
              builder: (context, trackColor, child) {
                return AudioFileWaveforms(
                    playerController: playerController,
                    continuousWaveform: true,
                    playerWaveStyle: PlayerWaveStyle(
                        fixedWaveColor: AppColors.primary.o5,
                        seekLineColor: trackColor.o4,
                        waveCap: StrokeCap.round,
                        spacing: 5.5.st,
                        seekLineThickness: 20.st,
                        liveWaveColor: AppColors.blue),
                    size: Size(Get.width * 0.7, 50.ht));
              },
            ),
            AppIcon(AppIcons.reload, onTap: () async {
              final file = await FileHandler.getMusicFile();
              ref.read(musicFileProvider.notifier).state = file;
              ref.invalidate(predictedDataProvider);
              chordValue.value = '';
            }, color: Get.disabledColor),
          ],
        ),
        ValueListenableBuilder(
          valueListenable: chordValue,
          builder: (context, value, child) {
            return AppText(value);
          },
        ),
      ],
    );
  }
}
