import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello_world_colors/data/named_color.dart';
import 'package:hello_world_colors/utils/utils.dart';

class All24BitColorList implements NamedColorList {
  static Random _random = Random();

  @override
  NamedColor operator [](int index) {

    // final Color color = Color(0xFF000000 + index);
    // final Color color = Color(0xFF000000 + _random.nextInt(index + 1));
    final Color color = Color(0xFF000000 + _random.nextInt(0x1000000));
    return NamedColor(color.toHexTriplet(), color);
  }

  @override
  int get length => 0xFFFFFF;
}
