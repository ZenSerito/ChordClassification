extension Double on double {
  Duration get hours => _getDuration(this);
  Duration get minutes => _getDuration(this, feature: "min");
  Duration get seconds => _getDuration(this, feature: 'sec');
  Duration get milliSeconds => _getDuration(this, feature: 'ms');
}

Duration _getDuration(double time, {String feature = "hour"}) {
  final intPart = time.truncate();
  final decimalPart = time - intPart;
  switch (feature) {
    case 'hour':
      return Duration(hours: intPart, minutes: (decimalPart * 60).round());
    case 'min':
      return Duration(minutes: intPart, seconds: (decimalPart * 60).round());
    case 'sec':
      return Duration(
          seconds: intPart, milliseconds: (decimalPart * 1000).round());
    case 'ms':
      return Duration(
          milliseconds: intPart, microseconds: (decimalPart * 1000).round());
    default:
      return Duration(
          seconds: intPart, milliseconds: (decimalPart * 1000).round());
  }
}
