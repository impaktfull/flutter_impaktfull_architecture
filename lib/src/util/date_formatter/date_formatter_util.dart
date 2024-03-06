import 'package:intl/intl.dart';

class DateFormatterUtil {
  const DateFormatterUtil._();
  static String formatDate(DateTime date) {
    final localDate = date.toLocal();
    final dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(localDate);
  }

  static String formatTime(DateTime date) {
    final localDate = date.toLocal();
    final dateFormat = DateFormat('HH:mm');
    return dateFormat.format(localDate);
  }

  static String formatDateTime(DateTime date) {
    final localDate = date.toLocal();
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');
    return dateFormat.format(localDate);
  }

  static String customFormat(DateTime date, String format) {
    final localDate = date.toLocal();
    final dateFormat = DateFormat(format);
    return dateFormat.format(localDate);
  }
}
