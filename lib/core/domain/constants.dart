import 'package:flutter/widgets.dart';

/// Application's relation literals
class AppLiterals {
  /// Application's title
  // TODO: This must be handle by App Bar Title and Flutter Login
  static const String title = 'JineOnkolojik\n\t\t\t\t\t\tDestek';

  /// Application's Logo
  static const String logo = 'assets/images/TODO:';

  /// Application's Copy Right text.
  static const String copyRight =
      'Copyright ©2021 CloudNesil – Cloud Computing, Development Consulting, Cutting The Edge Technology.';
}

class BackendURL {
  static const String devURL = "http://172.16.0.63:1337/";
  static const String testURL = "http://95.173.162.150:1337/";
  static const String productionURL = "";
}

// CloudFront
class CloudFrontPolicy {
  static const String policy =
      "eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cCo6Ly9kazNrNGM1aHdjZzY1LmNsb3VkZnJvbnQubmV0LyoiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2NzIzOTQzNDd9fX1dfQ__";
  static const String keyPairId = "APKAITTLE5ROAARZLSKQ";
  static const String signature =
      "lM~RtbiwrOhIBvo5MBH52XCxExzwAyE-UyQKaUsuXI5rfz04X7noPhYn~QicfS0mRnmC4kB~6CK-8nxwp4JeV-sQuwPvxREHgpiNew8o3lAV0svv6FaAwTHDHbuJkLxVq7p70gWYEzfBJVWfgmeYzB946do~iwXlo-cjU2Dj94SBzY5bOThCBLELmpCZ273oDhIr~LuOYw2Kqebpsuta5gpqO3ki7GVux41-XrONT13M5zwadYrW4xFe2qleQQ-QF4s24k2eVr6xRv0AUGbfBp~wmC~7d4vz-hAhyezJ6CxXCevyGLSZzLTlDe1iM~Jd6UG-DieusIWeFUzvtwUj8g__";
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
