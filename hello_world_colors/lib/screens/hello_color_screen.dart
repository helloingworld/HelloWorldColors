import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final String brightnessString = brightness == Brightness.light ? 'light' : 'dark';

    // final TextTheme textTheme = brightness == Brightness.light ? ThemeData
    //     .light()
    //     .textTheme :
    // ThemeData
    //     .dark()
    //     .textTheme;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: namedColor.color,
        appBar: AppBar(
          title: Text(namedColor.name),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.open_in_browser),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            tabs: <Tab>[
              Tab(icon: Icon(Icons.language)),
              Tab(icon: Icon(Icons.info_outline)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Hello, World! I\'m',
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        color: textColor,
                        fontSize: 34.0,
                      ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  namedColor.name,
                  style: Theme.of(context).textTheme.headline3.copyWith(color: textColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            _ColorInfoList(namedColor: namedColor),
          ],
        ),
      ),
    );
  }
}

class _ColorInfoList extends StatelessWidget {
  const _ColorInfoList({Key key, this.namedColor}) : super(key: key);

  final NamedColor namedColor;

  @override
  Widget build(BuildContext context) {
    final Color contrastColor = namedColor.isDark ? Colors.white : Colors.black;

    return ListTileTheme(
      textColor: contrastColor,
      iconColor: contrastColor,
      child: TextButtonTheme(
        data: TextButtonThemeData(
          style: TextButton.styleFrom(primary: contrastColor),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          children: <Widget>[
            _ColorInfoListTile(
              info: namedColor.name,
              description: 'name',
            ),
            _ColorInfoListTile(
              info: namedColor.toHexTriplet(),
              description: 'hex triplet',
            ),
            _ColorInfoListTile(
              info: namedColor.toRGBString(),
              description: 'red, green, blue',
            ),
            _ColorInfoListTile(
              info: namedColor.toHSLString(),
              description: 'hue, saturation, lightness',
            ),
            _ColorInfoListTile(
              info: namedColor.toHSVString(),
              description: 'hue, saturation, value',
            ),
            _ColorInfoListTile(
              info: namedColor.color.computeLuminance().toStringAsFixed(4),
              description: 'relative luminance',
            ),
            _ColorInfoListTile(
              info: namedColor.isDark ? 'dark' : 'light',
              description: 'brightness',
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorInfoListTile extends StatelessWidget {
  const _ColorInfoListTile({Key key, this.info, this.description}) : super(key: key);

  final String info;
  final String description;

  Future<void> onCopyPressed(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: info));
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$info copied'),
      // backgroundColor: Colors.white,
      // behavior: SnackBarBehavior.floating,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(info),
      subtitle: Text(description),
      trailing: TextButton(
        child: const Text('copy'),
        onPressed: () => onCopyPressed(context),
      ),
    );
  }
}
