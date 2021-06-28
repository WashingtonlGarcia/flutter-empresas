import 'dart:math' show Random;

import 'package:flutter/material.dart' show Colors, Color;

class ColorGenerator {
  static Color get random {
    final int value = Random().nextInt(16);
    return Colors.primaries[value];
  }
}
