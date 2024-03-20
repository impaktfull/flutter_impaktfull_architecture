import 'package:intl/intl.dart';

class NumberFormatterUtil {
  const NumberFormatterUtil._();
  static String formatDecilamWithComma(num number) {
    final dateFormat = NumberFormat("#,##0.0", "fr_FR");
    return dateFormat.format(number);
  }

  static String formatDecilamWithDot(num number) {
    final dateFormat = NumberFormat("#,##0.0", "fr_FR");
    return dateFormat.format(number);
  }
}
