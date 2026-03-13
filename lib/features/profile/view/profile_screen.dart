import 'package:flutter/material.dart';
import 'history_screen.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showWatchList = false;

  String profileName = "John Safwat";
  String profileAvatar = "assets/images/gamer (1).png";

  final List<String> historyMovies = [
    "assets/images/movie1.png",
    "assets/images/movie2.png",
    "assets/images/movie3.png",
    "assets/images/movie4.png",
    "assets/images/movie5.png",
    "assets/images/movie6.png",
  ];

  int selectedNavIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(profileAvatar),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        profileName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 30),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Column(
                            children: [
                              Text(
                                "12",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Wish List",
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            children: [
                              Text(
                                "10",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "History",
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 25),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const EditProfileScreen(),
                          ),
                        );

                        if (result != null) {
                          setState(() {
                            profileName = result["name"];
                            profileAvatar = result["avatar"];
                          });
                        }
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFC107),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Exit",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showWatchList = !showWatchList;
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HistoryScreen(historyMovies: historyMovies),
                        ),
                      );
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
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),

    
    );
  }
}