import 'package:flutter/material.dart';
import 'package:movies_app/features/browse/view/browse_screen.dart';
import 'package:movies_app/features/home/view/home_view.dart';
import 'package:movies_app/features/profile/view/profile_screen.dart';
import 'package:movies_app/features/search/view/search_view.dart';
import 'package:movies_app/features/home/view/widgets/bottom_nav_bar_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  // ✅ Remove `const` — Provider-based screens can't be const
  final List<Widget> pages = [
    const HomeScreen(),
    const SearchView(),
    const BrowseScreen(),
    const ProfileScreen(),
  ];

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      // ✅ Use IndexedStack to keep pages alive when switching tabs
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavBarWidget(
        selectedIndex: selectedIndex,
        onTap: changePage,
      ),
    );
  }
}

