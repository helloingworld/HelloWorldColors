import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

extension ColorX on Color {
  String toHexTriplet() => '#${(value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';

  String toRGBString() => 'rgb($red, $green, $blue)';

  String _toPercent(double value) => '${(value * 100).toStringAsFixed(0)}%';

  String toHSLString() {
    final HSLColor hslColor = HSLColor.fromColor(this);
    return 'hsl(${hslColor.hue.toStringAsFixed(0)}°, ${_toPercent(hslColor.saturation)}, ${_toPercent(hslColor.lightness)})';
  }

  String toHSVString() {
    final HSVColor hsvColor = HSVColor.fromColor(this);
    return 'hsv(${hsvColor.hue.toStringAsFixed(0)}°, ${_toPercent(hsvColor.saturation)}, ${_toPercent(hsvColor.value)})';
  }

  String toLuminanceString() => computeLuminance().toStringAsFixed(5);

  String toBrightnessString() => ThemeData.estimateBrightnessForColor(this).toString();
}

/// Shows a [SnackBar] with the specified [text] at the bottom of the specified scaffold.
void showSnackBar(BuildContext context, String text) {
  Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(text)));
}

/// Launches the specified [URL] in the mobile platform.
///
/// Shows an error [SnackBar] if there is no support for launching the URL.
Future<void> launchUrl(BuildContext context, String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    showSnackBar(context, 'Could not launch $url');
  }
}
