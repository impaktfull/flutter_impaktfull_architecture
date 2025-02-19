import 'dart:ui';

import 'package:intl/intl.dart';

class DateFormatterUtil {
  const DateFormatterUtil._();
  static String formatDate(DateTime date, [Locale? locale]) {
    final localDate = date.toLocal();
    final dateFormat = DateFormat('dd/MM/yyyy', locale?.languageCode);
    return dateFormat.format(localDate);
  }

  static String formatTime(DateTime date, [Locale? locale]) {
    final localDate = date.toLocal();
    final dateFormat = DateFormat('HH:mm', locale?.languageCode);
    return dateFormat.format(localDate);
  }

  static String formatDateTime(DateTime date, [Locale? locale]) {
    final localDate = date.toLocal();
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm', locale?.languageCode);
    return dateFormat.format(localDate);
  }

  static String customFormat(DateTime date, String format, [Locale? locale]) {
    final localDate = date.toLocal();
    final dateFormat = DateFormat(format, locale?.languageCode);
    return dateFormat.format(localDate);
  }
}
