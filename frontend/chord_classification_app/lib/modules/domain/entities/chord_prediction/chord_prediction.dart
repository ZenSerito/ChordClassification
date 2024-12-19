// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChordPrediction {
  int start;
  int end;
  String chord;
  double amplitude;

  ChordPrediction(
      {required this.start,
      required this.end,
      required this.chord,
      this.amplitude = 0.2});

  ChordPrediction copyWith({
    int? start,
    int? end,
    String? chord,
    double? amplitude,
  }) {
    return ChordPrediction(
      start: start ?? this.start,
      end: end ?? this.end,
      chord: chord ?? this.chord,
      amplitude: amplitude ?? this.amplitude,
    );
  }
}
