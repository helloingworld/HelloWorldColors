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
          bottom: const TabBar(
            tabs: <Tab>[
              // Tab(text: 'Hello'),
              Tab(icon: Icon(Icons.language)),
              Tab(icon: Icon(Icons.info_outline)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello, World! on',
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        color: textColor,
                        fontSize: 34.0,
                      ),
                ),
                Text(
                  namedColor.name,
                  style: Theme.of(context).textTheme.headline3.copyWith(color: textColor),
                ),
              ],
            ),
            _ColorInfoList(namedColor: namedColor),
          ],
        ),

        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: <Widget>[
        //     // Text('Hello World 2', style: textTheme.headline4),
        //     FittedBox(
        //       fit: BoxFit.fitWidth,
        //       child: Text(
        //         'Hello, World!',
        //         style: Theme.of(context).textTheme.headline1.copyWith(color: textColor),
        //       ),
        //     ),
        //     FittedBox(
        //       fit: BoxFit.fitWidth,
        //       child: Text(
        //         'I\'m ${namedColor.name}',
        //         // style: Theme.of(context).textTheme.headline4.copyWith(color: textColor),
        //         style: Theme.of(context).textTheme.headline1.copyWith(
        //               color: textColor,
        //               fontSize: Theme.of(context).textTheme.headline3.fontSize,
        //             ),
        //       ),
        //     ),
        //     const SizedBox(height: 32.0),
        //     Text(
        //       '${namedColor.toHexTriplet()}\n'
        //       'rgb(${namedColor.color.red}, ${namedColor.color.green}, ${namedColor.color.blue})\n'
        //       '${namedColor.toHSLString()}\n'
        //       '${namedColor.toHSVString()}',
        //       style: Theme.of(context).textTheme.headline1.copyWith(
        //             color: textColor,
        //             fontSize: Theme.of(context).textTheme.headline6.fontSize,
        //           ),
        //     ),
        //     const SizedBox(height: 32.0),
        //     // Text(
        //     //   '${namedColor.color.computeLuminance().toStringAsFixed(4)} ($brightnessString)',
        //     //   style: Theme.of(context).textTheme.headline1.copyWith(
        //     //         color: textColor,
        //     //         fontSize: Theme.of(context).textTheme.headline6.fontSize,
        //     //       ),
        //     // ),
        //     Wrap(
        //       crossAxisAlignment: WrapCrossAlignment.center,
        //       children: <Widget>[
        //         Icon(
        //             brightness == Brightness.dark
        //                 ? Icons.brightness_low
        //                 : Icons.brightness_high,
        //             color: textColor),
        //         const SizedBox(width: 8.0),
        //         Text(
        //           // namedColor.color.computeLuminance().toStringAsFixed(4),
        //           '${namedColor.color.computeLuminance().toStringAsFixed(4)} ($brightnessString)',
        //           style: Theme.of(context).textTheme.headline1.copyWith(
        //                 color: textColor,
        //                 fontSize: Theme.of(context).textTheme.headline6.fontSize,
        //               ),
        //         ),
        //       ],
        //     ),
        //     // Text(
        //     //   'I\'m ${namedColor.name}',
        //     //   style: Theme.of(context).textTheme.headline2.copyWith(color: textColor),
        //     // ),
        //   ],
        // ),
      ),
    );
  }
}

class _ColorInfoList extends StatelessWidget {
  const _ColorInfoList({Key key, this.namedColor}) : super(key: key);

  final NamedColor namedColor;

  @override
  Widget build(BuildContext context) {
    final String brightnessString = namedColor.isDark ? 'dark' : 'light';

    final Color contrastColor = namedColor.isDark ? Colors.white : Colors.black;
    return ListTileTheme(
      textColor: contrastColor,
      iconColor: contrastColor,
      child: ListView(
        // shrinkWrap: true,
        children: <Widget>[
          _ColorInfoListTile(info: namedColor.name),
          _ColorInfoListTile(info: namedColor.toHexTriplet()),
          _ColorInfoListTile(info: namedColor.toRGBString()),
          _ColorInfoListTile(info: namedColor.toHSLString()),
          _ColorInfoListTile(info: namedColor.toHSVString()),
          _ColorInfoListTile(info: '${namedColor.color.computeLuminance().toStringAsFixed(4)} ($brightnessString)'),
        ],
      ),
    );
  }
}

class _ColorInfoListTile extends StatelessWidget {
  const _ColorInfoListTile({Key key, this.info}) : super(key: key);

  final String info;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(info),
      trailing: IconButton(
        icon: const Icon(Icons.content_copy),
        onPressed: () {},
      ),
    );
  }
}
