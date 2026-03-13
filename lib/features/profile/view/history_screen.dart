import 'package:flutter/material.dart';
import 'package:movies_app/features/browse/view/browse_screen.dart';
import 'profile_screen.dart';

class HistoryScreen extends StatefulWidget {
  final List<String> historyMovies;

  const HistoryScreen({super.key, required this.historyMovies});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool showWatchList = false;
  bool showHistory = true;

  int selectedNavIndex = 3;

  void onNavTapped(int index) {
    setState(() {
      selectedNavIndex = index;
    });

    switch (index) {
      case 2:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const BrowseScreen()));
        break;
      case 3:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showWatchList = true;
                        showHistory = false;
                      });
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/icons/Group 20.png",
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Watch List",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showHistory = true;
                        showWatchList = false;
                      });
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/icons/Folder.png",
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "History",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 3,
                width: double.infinity,
                color: const Color(0xFFFFC107),
              ),
              const SizedBox(height: 20),
              if (showWatchList)
                Expanded(
                  child: Center(
                    child: Image.asset(
                      "assets/images/Empty 1.png",
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              if (showHistory)
                Expanded(
                  child: GridView.builder(
                    itemCount: widget.historyMovies.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 189 / 279,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                    ),
                    itemBuilder: (context, index) {
                      final movie = widget.historyMovies[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          movie,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),

      
    );
  }
}