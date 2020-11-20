import 'package:flutter/material.dart';

import 'named_color.dart';

class BasicColorTermList implements NamedColorList {
  @override
  NamedColor operator [](int index) => _basicColorTerms[index];

  @override
  int get length => _basicColorTerms.length;
}

const List<NamedColor> _basicColorTerms = [
  NamedColor('Black', Color(0xFF000000)),
  NamedColor('White', Color(0xFFFFFFFF)),
  NamedColor('Red', Color(0xFFFF0000)),
  NamedColor('Green', Color(0xFF008000)),
  NamedColor('Yellow', Color(0xFFFFFF00)),
  NamedColor('Blue', Color(0xFF0000FF)),
  NamedColor('Brown', Color(0xFFA52A2A)),
  NamedColor('Orange', Color(0xFFFFA500)),
  NamedColor('Pink', Color(0xFFFFC0CB)),
  NamedColor('Purple', Color(0xFF800080)),
  NamedColor('Grey', Color(0xFF808080)),
];
