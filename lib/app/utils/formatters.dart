import 'package:flutter/services.dart';

class Formatters {
  static final allowDecimals =
      FilteringTextInputFormatter.allow(RegExp(r'^\d+(\.\d*)?'));
}
