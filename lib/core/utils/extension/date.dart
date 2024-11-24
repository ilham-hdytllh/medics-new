import 'package:intl/intl.dart';

extension StringDateTimeExtension on String {
  String formatDate() {
    // Parse the string to DateTime
    DateTime dateTime = DateTime.parse(this);

    // Format the date
    final DateFormat dayFormat = DateFormat('d');
    final DateFormat monthFormat = DateFormat('MMMM');

    String day = dayFormat.format(dateTime);
    String month = monthFormat.format(dateTime);

    return '$day $month';
  }

  String formatYear() {
    // Parse the string to DateTime
    DateTime dateTime = DateTime.parse(this);
    final DateFormat yearFormat = DateFormat('yyyy');

    String year = yearFormat.format(dateTime);

    return '$year';
  }

  String formatTime() {
    // Parse the string to DateTime
    DateTime dateTime = DateTime.parse(this);

    // Format the time
    final DateFormat hourFormat = DateFormat('hh : mm a');

    return hourFormat.format(dateTime);
  }

  String formatDateTime() {
    // Combine both formatted date and time
    return '${formatDate()} ${formatYear()} ${formatTime()} ';
  }
}
