import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world_colors/data/named_color.dart';
import 'package:hello_world_colors/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class HelloColorScreen extends StatelessWidget {
  const HelloColorScreen({
    Key key,
    @required this.namedColor,
  })  : assert(namedColor != null),
        super(key: key);

  final NamedColor namedColor;

  Future<void> _onOpenInBrowserPressed(BuildContext context) async {
    final String colorComponent = Uri.encodeComponent(namedColor.color.toHexTriplet());
    final String url = 'https://www.google.com/search?q=${colorComponent}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Could not launch $url')));
    }
  }

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
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.tab),
                  tooltip: 'Open color in browser',
                  onPressed: () => _onOpenInBrowserPressed(context),
                );
              },
            ),
            // IconButton(
            //   icon: const Icon(Icons.tab),
            //   tooltip: 'Open color in browser',
            //   onPressed: () => _onOpenInBrowserPressed(context),
            // ),
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
              info: namedColor.color.toHexTriplet(),
              description: 'hex triplet',
            ),
            _ColorInfoListTile(
              info: namedColor.color.toRGBString(),
              // description: 'red, green, blue',
              description: 'RGB',
            ),
            _ColorInfoListTile(
              info: namedColor.color.toHSVString(),
              // description: 'hue, saturation, value',
              description: 'HSV',
            ),
            _ColorInfoListTile(
              info: namedColor.color.toHSLString(),
              // description: 'hue, saturation, lightness',
              description: 'HSL',
            ),
            _ColorInfoListTile(
              // info: namedColor.color.computeLuminance().toStringAsFixed(4),
              info: namedColor.color.toLuminanceString(),
              description: 'relative luminance',
            ),
            _ColorInfoListTile(
              info: namedColor.color.toBrightnessString(),
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
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$info copied to the clipboard')));
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
