import 'package:flutter/material.dart';
import 'package:movies_app/features/browse/models/movie_model.dart';


class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  int selectedCategory = 0;
  int selectedNavIndex = 2;

  final List<String> categories = [
    "Action",
    "Adventure",
    "Animation",
    "Drama",
  ];

  final List<Movie> movies = [
    Movie(image: "assets/images/movie1.png", rating: 7.7, category: "Action"),
    Movie(image: "assets/images/movie2.png", rating: 8.1, category: "Adventure"),
    Movie(image: "assets/images/movie3.png", rating: 6.9, category: "Animation"),
    Movie(image: "assets/images/movie4.png", rating: 7.5, category: "Drama"),
    Movie(image: "assets/images/movie5.png", rating: 8.4, category: "Action"),
    Movie(image: "assets/images/movie6.png", rating: 7.0, category: "Adventure"),
  ];

  List<Movie> get filteredMovies {
    String category = categories[selectedCategory];
    return movies.where((movie) => movie.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BrowseBody(
                categories: categories,
                selectedCategory: selectedCategory,
                onCategoryTap: (index) {
                  setState(() {
                    selectedCategory = index;
                  });
                },
                movies: filteredMovies,
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}

class BrowseBody extends StatelessWidget {
  final List<String> categories;
  final int selectedCategory;
  final ValueChanged<int> onCategoryTap;
  final List<Movie> movies;

  const BrowseBody({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryTap,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),

          CategoriesWidget(
            categories: categories,
            selectedCategory: selectedCategory,
            onCategoryTap: onCategoryTap,
          ),

          const SizedBox(height: 20),

          Expanded(
            child: GridView.builder(
              itemCount: movies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 189 / 279,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        movie.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xFFFFC107),
                              size: 14,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              movie.rating.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  final List<String> categories;
  final int selectedCategory;
  final ValueChanged<int> onCategoryTap;

  const CategoriesWidget({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isSelected = selectedCategory == index;

          return GestureDetector(
            onTap: () => onCategoryTap(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFFFC107)
                    : const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                categories[index],
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}