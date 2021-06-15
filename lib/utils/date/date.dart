class DateHelper {
  static bool dateIsGreater(DateTime a, DateTime b) =>
      a.millisecondsSinceEpoch > b.millisecondsSinceEpoch;
}
