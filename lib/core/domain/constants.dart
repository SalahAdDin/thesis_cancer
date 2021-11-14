import 'package:flutter/widgets.dart';

/// Application's relation literals
class AppLiterals {
  /// Application's title
  static const String title = 'JineOnkDes';

  /// Application's Logo
  static const String logo = 'assets/images/TODO:';

  /// Application's Copy Right text.
  static const String copyRight =
      'Copyright ©2021 CloudNesil – Cloud Computing, Development Consulting, Cutting The Edge Technology.';
}

class BackendURL {
  static const String devURL = "http://10.30.30.213:1337/";
  static const String testURL = "http://95.173.162.150:1337/";
}

/// Global key to identify UI elements
class GlobalKeys {
  ///
  final GlobalKey knowledgeButtonKey = GlobalKey();

  ///
  final GlobalKey treatmentButtonKey = GlobalKey();

  ///
  final GlobalKey academyButtonKey = GlobalKey();

  ///
  final GlobalKey successStoriesButtonKey = GlobalKey();

  ///
  final GlobalKey userNameButtonKey = GlobalKey();

  ///
  final GlobalKey notificationButtonKey = GlobalKey();
}
