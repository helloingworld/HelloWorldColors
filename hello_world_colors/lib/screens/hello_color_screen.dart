import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world_colors/data/named_color.dart';
import 'package:hello_world_colors/utils/utils.dart';
import 'package:hello_world_colors/widgets/color_info_list.dart';

class HelloColorScreen extends StatelessWidget {
  const HelloColorScreen({
    Key key,
    @required this.namedColor,
  })  : assert(namedColor != null),
        super(key: key);

  final NamedColor namedColor;

  Future<void> _onOpenInBrowserPressed(BuildContext context) async {
    final String colorComponent = Uri.encodeComponent(namedColor.color.toHexTriplet());
    final String url = 'https://www.google.com/search?q=$colorComponent';
    launchUrl(context, url);
  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = ThemeData.estimateBrightnessForColor(namedColor.color);
    final Color textColor = brightness == Brightness.light ? Colors.black : Colors.white;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: namedColor.color,
        appBar: AppBar(
          title: Text(namedColor.name),
          actions: <Widget>[
            Builder(
              // Create an inner BuildContext so that the onPressed methods can find the Scaffold
              builder: (BuildContext context) {
                return IconButton(
                  // icon: const Icon(Icons.tab),
                  icon: const Icon(Icons.open_in_browser),
                  tooltip: 'Open color info in browser',
                  onPressed: () => _onOpenInBrowserPressed(context),
                );
              },
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
            ColorInfoList(namedColor: namedColor),
          ],
        ),
      ),
    );
  }
}

