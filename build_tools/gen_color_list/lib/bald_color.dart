import 'dart:math';

class BaldColor {
  const BaldColor(int value) : value = value & 0xFFFFFFFF;

  final int value;

  int get red => (0x00ff0000 & value) >> 16;

  int get green => (0x0000ff00 & value) >> 8;

  int get blue => (0x000000ff & value) >> 0;

  static double _linearizeColorComponent(double component) {
    if (component <= 0.03928) return component / 12.92;
    return pow((component + 0.055) / 1.055, 2.4) as double;
  }

  double computeLuminance() {
    final double R = _linearizeColorComponent(red / 0xFF);
    final double G = _linearizeColorComponent(green / 0xFF);
    final double B = _linearizeColorComponent(blue / 0xFF);
    return 0.2126 * R + 0.7152 * G + 0.0722 * B;
  }
}

bool isDarkColor(BaldColor color) {
  final double relativeLuminance = color.computeLuminance();
  const double kThreshold = 0.15;
  return !((relativeLuminance + 0.05) * (relativeLuminance + 0.05) > kThreshold);
}

String toHexColorString(int value) => '0x${(value | 0xFF000000).toRadixString(16).padLeft(8, '0').toUpperCase()}';
