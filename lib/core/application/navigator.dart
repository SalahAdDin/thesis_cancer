import 'package:flutter/material.dart';

/// Navigate to Page.
Future<void> pushToPage(NavigatorState navigator, Widget widget) async =>
    navigator.push(
      MaterialPageRoute<Widget>(builder: (_) => widget),
    );

/// Navigate to page by replacing the current one on the stack.
Future<void> pushAndReplaceToPage(
  NavigatorState navigator,
  Widget widget,
) async =>
    navigator.pushReplacement(
      MaterialPageRoute<Widget>(builder: (_) => widget),
    );

/// Navigate to page and replace previous pages on stack till the root page.
Future<void> popAllAndPush(BuildContext context, Widget widget) async =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute<Widget>(builder: (BuildContext context) => widget),
      ModalRoute.withName('/'),
    );
