import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChordPrediction {
  int start;
  int end;
  String chord;

  ChordPrediction(
      {required this.start,
      required this.end,
      required this.chord});

  ChordPrediction copyWith({
    int? start,
    int? end,
    String? chord,
  }) {
    return ChordPrediction(
      start: start ?? this.start,
      end: end ?? this.end,
      chord: chord ?? this.chord,
    );
  }


  @override
  String toString() {
    return jsonEncode(<String, dynamic>{
      'start': start,
      'end': end,
      'chord': chord,
    });
  }
}
