import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../../core/configs/app_colors.dart';
import '../../../../../core/constants/chord_map.dart';
import '../../../../../core/extensions/extensions.dart';
import '../../../../../core/services/get.dart';
import '../../../../../core/utils/controller_providers.dart';
import '../../../../domain/entities/chord_prediction/chord_prediction.dart';

class GraphView extends ConsumerWidget {
  const GraphView(this.predictions, {super.key});

  final List<ChordPrediction> predictions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rangeController = ref.watch(rangeControllerProvider);
    return SfCartesianChart(
      key: Get.key(predictions),
      enableAxisAnimation: true,
      primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Chords')),
      primaryYAxis: NumericAxis(
          rangeController: rangeController,
          minimum: 0,
          maximum: predictions.last.end.toDouble() + 8,
          rangePadding: ChartRangePadding.additionalStart,
          isVisible: true,
          title: AxisTitle(text: 'Duration'),
          enableAutoIntervalOnZooming: true),
      tooltipBehavior: TooltipBehavior(enable: true, canShowMarker: false),
      isTransposed: true,
      margin: EdgeInsets.zero,
      enableSideBySideSeriesPlacement: true,
      zoomPanBehavior: ZoomPanBehavior(
          enablePinching: false,
          enablePanning: true,
          zoomMode: ZoomMode.x,
          enableDoubleTapZooming: false),
      series: [
        RangeColumnSeries<ChordPrediction, String>(
          dataSource: predictions,
          xValueMapper: (ChordPrediction data, _) => data.chord,
          lowValueMapper: (datum, index) => datum.start,
          highValueMapper: (datum, index) => datum.end,
          enableTrackball: true,
          pointColorMapper: (datum, index) =>
              chordToColor[datum.chord] ?? AppColors.titleColor,
          dataLabelSettings: DataLabelSettings(
              isVisible: true,
              textStyle: Get.bodySmall.px10,
              margin: EdgeInsets.zero),
        )
      ],
    );
  }
}
