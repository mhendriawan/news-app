import 'package:intl/intl.dart';

formattedDate(DateTime dateTime) {
  String formattedDate = DateFormat('dd MMM y').format(dateTime);
  return formattedDate;
}
