import 'package:intl/intl.dart';

class ClimataUtil {
  String getFormattedCurrentDate () {
    DateTime currentUnformattedDate = DateTime.now();
    return DateFormat.yMMMMEEEEd().format(currentUnformattedDate);
  }
}