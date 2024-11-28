import 'dart:convert';

extension Stringx on String {
  String get emoji => _emojiDecoder(this);
}

String _emojiDecoder(String text) {
  String data = '';
  try {
    List<int> bytes = text.codeUnits;
    data = utf8.decode(bytes);
  } catch (e) {
    data = text;
  }
  return data;
}
