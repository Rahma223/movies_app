import 'package:flutter/material.dart';
import 'package:movies_app/features/browse/view/browse_screen.dart';
import 'package:movies_app/features/profile/view/profile_screen.dart';


class BottomNavBarWidget2 extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const BottomNavBarWidget2({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  Widget buildNavIcon(String path, int index) {
    return Image.asset(
      path,
      width: 24,
      color: selectedIndex == index ? const Color(0xFFFFC107) : Colors.white54,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF1E1E1E),
      currentIndex: selectedIndex,
      onTap: (index) {
        onTap(index);

        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const Center(
                  child: Text(
                    "Home Screen",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const Center(
                  child: Text(
                    "Search Screen",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const BrowseScreen(),
              ),
            );
            break;
          case 3: // Profile
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const ProfileScreen(),
              ),
            );
            break;
        }
      },
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: buildNavIcon("assets/icons/Vector (1).png", 0),
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
          icon: buildNavIcon("assets/icons/Profile.png", 3),
          label: "",
        ),
      ],
    );
  }
}