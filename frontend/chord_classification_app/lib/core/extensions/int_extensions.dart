extension Intx on int {
  Duration get seconds => Duration(seconds: this);
  Duration get minutes => Duration(minutes: this);
  Duration get hours => Duration(hours: this);
  Duration get milliSeconds => Duration(milliseconds: this);
  Duration get microSeconds => Duration(microseconds: this);
}
