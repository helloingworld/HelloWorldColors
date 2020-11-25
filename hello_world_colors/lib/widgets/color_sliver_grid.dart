import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hello_world_colors/data/named_color.dart';
import 'package:hello_world_colors/utils/utils.dart';

class NamedColorSliverGrid extends StatelessWidget {
  const NamedColorSliverGrid({
    Key key,
    @required this.namedColorList,
    this.onItemSelected,
  })  : assert(namedColorList != null),
        super(key: key);

  final List<NamedColor> namedColorList;

  final void Function(NamedColor value) onItemSelected;

  @override
  Widget build(BuildContext context) {
    // print('key $key');
    return SliverGrid(
      gridDelegate: standardSliverGridDelegate(context),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => _ColorGridTile(
          namedColor: namedColorList[index],
          onSelected: onItemSelected,
        ),
        childCount: namedColorList.length,
      ),
    );
  }

  static SliverGridDelegateWithMaxCrossAxisExtent standardSliverGridDelegate(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 180.0,
      crossAxisSpacing: 6.0,
      mainAxisSpacing: 6.0,
      childAspectRatio: screenSize.width / screenSize.height,
    );
  }
}

class TrueColorSliverGrid extends StatelessWidget {
  const TrueColorSliverGrid({
    Key key,
    this.onItemSelected,
  }) : super(key: key);

  static final Random _random = Random();

  final void Function(NamedColor value) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: NamedColorSliverGrid.standardSliverGridDelegate(context),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final Color color = Color(0xFF000000 + index);
          // final Color color = Color(0xFF000000 + _random.nextInt(0x1000000));
          final bool isDark = ThemeData.estimateBrightnessForColor(color) == Brightness.dark;
          return _ColorGridTile(
            namedColor: NamedColor(name: color.toHexTriplet(), color: color, isDark: isDark),
            onSelected: onItemSelected,
          );
        },
        childCount: 0xFFFFFF,
      ),
    );
  }
}

class _ColorGridTile extends StatelessWidget {
  const _ColorGridTile({
    Key key,
    @required this.namedColor,
    this.onSelected,
  })  : assert(namedColor != null),
        super(key: key);

  final NamedColor namedColor;

  final void Function(NamedColor value) onSelected;

  @override
  Widget build(BuildContext context) {
    final Color textColor = namedColor.isDark ? Colors.white : Colors.black;

    return Material(
      color: namedColor.color,
      child: InkWell(
        onTap: () => onSelected?.call(namedColor),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            namedColor.name,
            style: Theme.of(context).textTheme.caption.copyWith(color: textColor),
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

