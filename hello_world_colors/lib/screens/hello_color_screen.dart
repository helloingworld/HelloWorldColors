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
          actions: [
            // IconButton(
            //   icon: const Icon(Icons.copy),
            //   onPressed: () {},
            // ),
            IconButton(
              icon: const Icon(Icons.open_in_browser),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            tabs: <Tab>[
              // Tab(text: 'Hello'),
              // Tab(text: 'Info'),
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
                  'Hello, World! I\'m',
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
      // iconColor: contrastColor.withOpacity(0.75),
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
              subtitle: 'name',
            ),
            _ColorInfoListTile(info: namedColor.toHexTriplet(), subtitle: 'hex triplet'),
            _ColorInfoListTile(info: namedColor.toRGBString(), subtitle: 'red, green, blue'),
            _ColorInfoListTile(
                info: namedColor.toHSLString(), subtitle: 'hue, saturation, lightness'),
            _ColorInfoListTile(info: namedColor.toHSVString(), subtitle: 'hue, saturation, value'),
            _ColorInfoListTile(
              info: namedColor.color.computeLuminance().toStringAsFixed(4),
              subtitle: 'relative luminance',
            ),
            _ColorInfoListTile(info: namedColor.isDark ? 'dark' : 'light', subtitle: 'brightness'),
          ],
        ),
      ),
    );
  }
}

class _ColorInfoListTile extends StatelessWidget {
  const _ColorInfoListTile({Key key, this.info, this.subtitle}) : super(key: key);

  final String info;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(info),
      subtitle: Text(subtitle),
      trailing: TextButton(
        child: const Text('copy'),
        onPressed: () {},
      ),
      // trailing: Wrap(
      //   children: [
      //     IconButton(
      //       // iconSize: 20.0,
      //       icon: const Icon(Icons.content_copy),
      //       onPressed: () {},
      //     ),
      //     IconButton(
      //       // iconSize: 20.0,
      //       icon: const Icon(Icons.search),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),

      // trailing: IconButton(
      //   icon: const Icon(Icons.content_copy),
      //   onPressed: () {},
      // ),
    );
  }
}
