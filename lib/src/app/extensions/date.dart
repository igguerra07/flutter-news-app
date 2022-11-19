import 'package:intl/intl.dart';

extension DateStringExtension on String {
  String toDateString() {
    final date = DateTime.parse(this);
    return DateFormat('dd/MM/yyy – HH:mm').format(date);
  }
}
