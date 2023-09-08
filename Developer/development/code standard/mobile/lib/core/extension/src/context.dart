part of "../extensions.dart";

extension MediaQueryExtension on BuildContext {
  /// How to use :>
  /// Example
  /// context.width => return Screen size width

  /// Return Screen width
  double get width => MediaQuery.of(this).size.width;

  /// Return Screen height
  double get height => MediaQuery.of(this).size.height;

  /// Return Screen size
  Size get mediaSize => MediaQuery.of(this).size;

  /// Return true when orientation is landscape
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;

  /// Return true when orientation is portrait
  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;

  /// Checking Context is mounted
  bool get mounted {
    try {
      widget;
      return true;
    } catch (e) {
      return false;
    }
  }
}