import 'package:flutter/material.dart';
import 'package:hello_world_colors/data/named_color.dart';

class NamedColorGridView extends StatelessWidget {
  final NamedColorList namedColorList;

  const NamedColorGridView({
    Key key,
    @required this.namedColorList,
  })  : assert(namedColorList != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return GridView.builder(
      itemCount: namedColorList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // crossAxisCount: screenSize.width ~/ 180,
        crossAxisCount: screenSize.width ~/ 120,
        // crossAxisCount: 3,
        childAspectRatio: screenSize.width / screenSize.height,
      ),
      itemBuilder: (BuildContext context, int index) =>
          NamedColorGridTile(namedColor: namedColorList[index]),
    );
  }
}

class NamedColorGridTile extends StatelessWidget {
  final NamedColor namedColor;

  const NamedColorGridTile({
    Key key,
    @required this.namedColor,
  })  : assert(namedColor != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = ThemeData.estimateBrightnessForColor(namedColor.color);
    // final Color textColor = brightness == Brightness.light ? Colors.black : Colors.white;
    // final Color textColor = brightness == Brightness.light ? ThemeData.dark().textTheme.caption.color : Colors.white;
    // final TextStyle subtitleStyle = Theme.of(context).textTheme.bodyText1.copyWith(color: textColor);
    final TextTheme textTheme =
        brightness == Brightness.light ? ThemeData.light().textTheme : ThemeData.dark().textTheme;

    // final TextStyle titleStyle = brightness == Brightness.light
    //     ? ThemeData.light().textTheme.subtitle1
    //     : ThemeData.dark().textTheme.subtitle2;
    // final TextStyle subtitleStyle = brightness == Brightness.light
    //     ? ThemeData.light().textTheme.caption
    //     : ThemeData.dark().textTheme.caption;
    // print('${namedColor.name} => $textColor');

    return Card(
      child: GridTile(
        header: GridTileBar(
          // title: Text(namedColor.name),
          title: Text(namedColor.name, style: textTheme.subtitle1),
          // title: Text(namedColor.name, style: TextStyle(color: textColor)),
          // subtitle: Text(namedColor.toHexTriplet()),
          // subtitle: Text(namedColor.toHexTriplet(), style: textTheme.caption),
        ),
        // footer: GridTileBar(
        //   leading: const Icon(Icons.brightness_3, size: 16.0),
        //   subtitle: Text(namedColor.color.computeLuminance().toStringAsFixed(4)),
        // ),
        child: Material(
          child: InkWell(
            onTap: () {
              // AppSettings().color.value = blackAlt.color;
              // AppSettings().colorName.value = blackAlt.name;
              // Navigator.pop(context);
            },
          ),
          color: namedColor.color,
        ),
      ),
    );
  }
}
