class StringHelper {
  static String getNumberWithZero(int number) =>
      number < 10 ? '0$number' : '$number';
}
