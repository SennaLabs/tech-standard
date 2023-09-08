part of '../extensions.dart';

extension ColorExtension on Color {
  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write("ff");
    buffer.write(hexString.replaceFirst("#", ""));
    Color color = Color(int.parse(buffer.toString(), radix: 16));
    return color;
  }

  Color fromHexOrRGBToColor(String colorStr) {
    RegExp hexColorRegex = RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6}|[0-9a-fA-F]{8})$');
    if (colorStr.startsWith("rgba")) {
      List rgbaList = colorStr.substring(5, colorStr.length - 1).split(",");
      return Color.fromRGBO(int.parse(rgbaList[0]), int.parse(rgbaList[1]), int.parse(rgbaList[2]),
          double.parse(rgbaList[3]));
    } else if (colorStr.startsWith("rgb")) {
      List rgbList =
      colorStr.substring(4, colorStr.length - 1).split(",").map((c) => int.parse(c)).toList();
      return Color.fromRGBO(rgbList[0], rgbList[1], rgbList[2], 1.0);
    } else if (hexColorRegex.hasMatch(colorStr)) {
      if (colorStr.length == 4) {
        colorStr = colorStr + colorStr.substring(1, 4);
      }
      if (colorStr.length == 7) {
        int colorValue = int.parse(colorStr.substring(1), radix: 16);
        return Color(colorValue).withOpacity(1.0);
      } else {
        int colorValue = int.parse(colorStr.substring(1, 7), radix: 16);
        double opacityValue = int.parse(colorStr.substring(7), radix: 16).toDouble() / 255;
        return Color(colorValue).withOpacity(opacityValue);
      }
    } else {
      return Colors.transparent;
    }
  }
}