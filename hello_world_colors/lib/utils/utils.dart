import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

extension ColorX on Color {
  String toHexTriplet() => '#${(value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
}

// /// Shows a [SnackBar] with the specified [text] at the bottom of the specified scaffold.
// void showSnackBar(BuildContext context, String text) {
//   Scaffold.of(context)
//     ..removeCurrentSnackBar()
//     ..showSnackBar(SnackBar(content: Text(text)));
// }

/// Shows a [SnackBar] with the specified [text] at the bottom of the specified scaffold.
void showSnackBar(ScaffoldState scaffoldState, String text) {
  scaffoldState
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(text)));
}

// /// Launches the specified [URL] in the mobile platform.
// ///
// /// Shows an error [SnackBar] if there is no support for launching the URL.
// Future<void> launchUrl(BuildContext context, String url) async {
//   if (await canLaunch(url)) {
//     showSnackBar(context, 'Could not launch $url');
//     // await launch(url);
//   } else {
//     showSnackBar(context, 'Could not launch $url');
//   }
// }

/// Launches the specified [URL] in the mobile platform.
///
/// Shows an error [SnackBar] if there is no support for launching the URL.
Future<void> launchUrl(ScaffoldState scaffoldState, String url) async {
  if (await canLaunch(url)) {
    // showSnackBar(scaffoldState, 'Could not launch $url');
    await launch(url);
  } else {
    showSnackBar(scaffoldState, 'Could not launch $url');
  }
}
