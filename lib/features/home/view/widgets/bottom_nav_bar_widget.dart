import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const BottomNavBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  Widget buildNavIcon(String path, int index) {
    return Image.asset(
      path,
      width: 24,
      color: selectedIndex == index
          ? const Color(0xFFFFC107)
          : Colors.white54,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF1E1E1E),
      currentIndex: selectedIndex,
      onTap: onTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: buildNavIcon("assets/icons/Vector.png", 0),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: buildNavIcon("assets/icons/Vector (6).png", 1),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: buildNavIcon("assets/icons/explore.png", 2),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: buildNavIcon("assets/icons/Profiel.png", 3),
          label: "",
        ),
      ],
    );
  }
}