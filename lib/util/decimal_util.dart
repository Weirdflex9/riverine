import 'package:decimal/decimal.dart';

enum DecimalUnit {
  YUAN, // ¥6.00
  NONE, // 金额无单位修饰
}

class DecimalUtil {
  static String formatPrice(double price, {DecimalUnit unit = DecimalUnit.YUAN}) {
     if (unit == DecimalUnit.YUAN) {
      return '¥${Decimal.parse(price.toStringAsFixed(2))}';
    } else {
      return '${Decimal.parse(price.toStringAsFixed(2))}';
    }
  }
}
