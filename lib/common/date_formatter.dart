import 'package:intl/intl.dart';

String dateReleaseFormatter(DateTime? date) {
  try {
    if (date == null) {
      return 'N/A';
    }

    var inputFormat = DateFormat('MMM dd, yyyy');
    var inputDate = inputFormat.format(date);
    return inputDate;
  } catch (e) {
    return 'N/A';
  }
}