import 'package:intl/intl.dart';

extension StringExtensions on String {
  String getDayNameFromDateTime({required DateTime dateTime}) =>
      DateFormat("EEEE").format(dateTime);

  String getFormattedDateTime({required DateTime dateTime}) =>
      DateFormat.yMMMEd().add_jm().format(dateTime);
}
