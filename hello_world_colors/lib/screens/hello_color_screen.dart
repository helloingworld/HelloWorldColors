import 'package:flutter/material.dart';
import 'package:hello_world_colors/data/named_color.dart';

class HelloColorScreen extends StatelessWidget {
  const HelloColorScreen({
    Key key,
    @required this.namedColor,
  })  : assert(namedColor != null),
        super(key: key);

  final NamedColor namedColor;

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = ThemeData.estimateBrightnessForColor(namedColor.color);
    final Color textColor = brightness == Brightness.light ? Colors.black : Colors.white;

    // final TextTheme textTheme = brightness == Brightness.light ? ThemeData
    //     .light()
    //     .textTheme :
    // ThemeData
    //     .dark()
    //     .textTheme;

    return Scaffold(
      backgroundColor: namedColor.color,
      appBar: AppBar(
        title: Text(namedColor.name),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Text('Hello World 2', style: textTheme.headline4),
            Text(
              'Hello, World!\nI\'m ${namedColor.name}',
              style: Theme.of(context).textTheme.headline1.copyWith(color: textColor),
              overflow: TextOverflow.fade,
              softWrap: true,
            ),
            // Text(
            //   'I\'m ${namedColor.name}',
            //   style: Theme.of(context).textTheme.headline2.copyWith(color: textColor),
            // ),
          ],
        ),
      ),
    );
  }
}
