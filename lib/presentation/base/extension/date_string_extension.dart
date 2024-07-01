import 'package:intl/intl.dart';

extension StringExtension on String {
  String getFormattedDate() {
    DateTime dateTime = DateFormat("yyyy-MM-ddThh:mm:ss").parse(this,true);
    var dateLocal = dateTime.toLocal();
    return DateFormat("hh:mm   dd/MM/yyyy").format(dateLocal);
  }
}
