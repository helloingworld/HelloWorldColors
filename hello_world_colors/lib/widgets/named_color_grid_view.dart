import 'package:flutter/material.dart';
import 'package:hello_world_colors/data/named_color.dart';
import 'package:hello_world_colors/screens/hello_color_screen.dart';

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
    print(screenSize);

    return GridView.builder(
      itemCount: namedColorList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // crossAxisCount: screenSize.width ~/ 180,
        // crossAxisCount: screenSize.width ~/ 135,
        crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 3 : 4,
        crossAxisSpacing: 6.0,
        mainAxisSpacing: 6.0,
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
    // print(brightness);
    final Color textColor = brightness == Brightness.light ? Colors.black : Colors.white;
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

    return GridTile(
      header: GridTileBar(
        // backgroundColor: Colors.grey[200],
        // title: Text(namedColor.name),
        // title: Text(namedColor.name, style: textTheme.subtitle1),
        // title: Text(namedColor.name, style: textTheme.caption),
        title: Text(
          namedColor.name,
          style: Theme.of(context).textTheme.caption.copyWith(color: textColor),
        ),
        // title: Text(
        //   namedColor.name,
        //   style: Theme.of(context).textTheme.caption.copyWith(
        //     color: Colors.white,
        //     shadows: [
        //       Shadow(
        //         offset: Offset(1.0, 1.0),
        //         blurRadius: 2.0,
        //         color: Color.fromARGB(255, 0, 0, 0),
        //       ),
        //     ],
        //   ),
        // ),
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
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => HelloColorScreen(namedColor: namedColor)),
            );
          },
        ),
        color: namedColor.color,
      ),
    );
  }
}
