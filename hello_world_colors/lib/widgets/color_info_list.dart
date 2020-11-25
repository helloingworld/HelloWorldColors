import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world_colors/data/named_color.dart';
import 'package:hello_world_colors/utils/utils.dart';

class ColorInfoList extends StatelessWidget {
  const ColorInfoList({Key key, this.namedColor}) : super(key: key);

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
              description: 'red, green, blue',
            ),
            _ColorInfoListTile(
              info: namedColor.color.toHSVString(),
              description: 'hue, saturation, value',
            ),
            _ColorInfoListTile(
              info: namedColor.color.toHSLString(),
              description: 'hue, saturation, lightness',
            ),
            _ColorInfoListTile(
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
    showSnackBar(context, '$info copied to the clipboard');
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
