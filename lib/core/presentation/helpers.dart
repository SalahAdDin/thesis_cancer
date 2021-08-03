import 'dart:ui';

const List<Color> colors = <Color>[
  Color(0xfffd5353),
  Color(0xff00a478),
  Color(0xfff5a2d9),
  Color(0xfff0c722),
  Color(0xff6a85e5),
  Color(0xfffd9a6f),
  Color(0xff92db6e),
  Color(0xff73b8e5),
  Color(0xfffd7590),
  Color(0xffc78ae5),
  Color(0xffccede4),
  Color(0xff3c4952),
];

Color getUserAvatarNameColor(String url) {
  final int index = url.hashCode % colors.length;
  return colors[index];
}
