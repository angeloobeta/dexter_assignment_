// this is used to return the substring of a long string
// that might possibly overflow when put inside a widget

import 'numberConverter.dart';

String processLongString(
    {required String unProcessedString,
    required int minimumStringLength,
    required int substringLength}) {
  return unProcessedString.length > minimumStringLength
      ? unProcessedString.substring(0, substringLength) + ".."
      : unProcessedString;
}

processLongDouble(
    {required String unProcessedDoubleString,
    required int minimumStringLength}) {
  return unProcessedDoubleString.length > minimumStringLength
      ? k_m_b_generator(double.parse(unProcessedDoubleString.toString()))
      : unProcessedDoubleString;
}
