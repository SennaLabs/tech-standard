part of '../app_scaffold.dart';

class AppLayoutBottomNavigationBar extends StatelessWidget {
  const AppLayoutBottomNavigationBar({
    Key? key,
    this.isMainAppLayout = false,
    this.currentIndex = 0,
    this.size,
    this.decoration,
    this.items = const [],
    required this.onTap,
  }) : super(key: key);

  final bool isMainAppLayout;
  final int currentIndex;
  final Size? size;
  final Decoration? decoration;
  final List<BottomNavigationBarItem> items;
  final Function(int) onTap;

  factory AppLayoutBottomNavigationBar.main({
    required int currentIndex,
    required Function(int) onTap,
  }) {
    return AppLayoutBottomNavigationBar(
      isMainAppLayout: true,
      currentIndex: currentIndex,
      items: _items,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    /// If "isMainAppLayout" is false, "items" must not be empty.
    if (!isMainAppLayout) {
      assert(!isMainAppLayout && items.isNotEmpty);
    }

    return Container(
      width: size?.width,
      height: size?.height,
      decoration: decoration,
      child: isMainAppLayout
          ? BottomNavigationBar(
              key: AppLayout.bottomNavigatorKey,
              backgroundColor: Colors.white,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              iconSize: 24,
              selectedFontSize: 14,
              unselectedFontSize: 14,
              selectedItemColor: AppTheme.color.primaryBlackColor,
              selectedIconTheme: IconThemeData(color: AppTheme.color.primaryBlueColor),
              selectedLabelStyle: AppTheme.font.mitrS12.copyWith(
                fontWeight: FontWeight.w500,
                color: AppTheme.color.primaryBlackColor,
              ),
              unselectedLabelStyle: AppTheme.font.mitrS12.copyWith(
                fontWeight: FontWeight.w500,
                color: AppTheme.color.primaryBlueGrayColor,
              ),
              unselectedIconTheme: IconThemeData(color: AppTheme.color.primaryBlueGrayColor),
              unselectedItemColor: AppTheme.color.primaryBlueGrayColor,
              currentIndex: currentIndex,
              items: _items,
              onTap: onTap,
            )
          : BottomNavigationBar(
              currentIndex: currentIndex,
              items: items,
            ),
    );
  }

  static final List<BottomNavigationBarItem> _items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "หน้าแรก",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: "ค้นหา",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.bar_chart),
      label: "สถิติ",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: "โปรไฟล์",
    ),
  ];
}
