import 'package:intl/intl.dart';

String formatPrice(double price) {
  final formatter = NumberFormat.currency(
    locale: 'en_NG',
    symbol: '₦',
    decimalDigits: 2,
  );
  return formatter.format(price);
}
