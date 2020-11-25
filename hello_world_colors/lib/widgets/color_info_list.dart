import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorInfoList extends StatelessWidget {
  const ColorInfoList({
    Key key,
    @required this.color,
    this.colorName,
    this.textColor,
  }) : super(key: key);

  final Color color;
  final String colorName;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      textColor: textColor,
      child: TextButtonTheme(
        data: TextButtonThemeData(
          style: TextButton.styleFrom(primary: textColor),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          shrinkWrap: true,
          children: <Widget>[
            _ColorInfoListTile(
              info: colorName,
              description: 'name',
            ),
            _ColorInfoListTile(
              info: color.toHexTriplet(),
              description: 'hex triplet',
            ),
            _ColorInfoListTile(
              info: color.toRGBString(),
              description: 'red, green, blue',
            ),
            _ColorInfoListTile(
              info: color.toHSVString(),
              description: 'hue, saturation, value',
            ),
            _ColorInfoListTile(
              info: color.toHSLString(),
              description: 'hue, saturation, lightness',
            ),
            _ColorInfoListTile(
              info: color.toLuminanceString(),
              description: 'relative luminance',
            ),
            _ColorInfoListTile(
              info: color.toBrightnessString(),
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
      ..showSnackBar(SnackBar(content: Text('$info copied to clipboard')));
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

extension on Color {
  String toHexTriplet() => '#${(value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';

  String toRGBString() => 'rgb($red, $green, $blue)';

  String _toPercent(double value) => '${(value * 100).toStringAsFixed(0)}%';

  String toHSLString() {
    final HSLColor hslColor = HSLColor.fromColor(this);
    return 'hsl(${hslColor.hue.toStringAsFixed(0)}, ${_toPercent(hslColor.saturation)}, ${_toPercent(hslColor.lightness)})';
  }

  String toHSVString() {
    final HSVColor hsvColor = HSVColor.fromColor(this);
    return 'hsv(${hsvColor.hue.toStringAsFixed(0)}, ${_toPercent(hsvColor.saturation)}, ${_toPercent(hsvColor.value)})';
  }

  String toLuminanceString() => computeLuminance().toStringAsFixed(5);

  String toBrightnessString() => describeEnum(ThemeData.estimateBrightnessForColor(this));
}
