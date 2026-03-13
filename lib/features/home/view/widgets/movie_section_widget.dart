import 'package:flutter/material.dart';
import 'package:movies_app/features/home/model/home_movie.dart';
import 'package:movies_app/features/home/view/widgets/rating_badge_widget.dart';

class MovieSectionWidget extends StatelessWidget {
  final String title;
  final List<HomeMovie> movies;
  final void Function(String movieId) onMovieTap;
  final VoidCallback onSeeMore;
 
  const MovieSectionWidget({
    required this.title,
    required this.movies,
    required this.onMovieTap,
    required this.onSeeMore,
  });
 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: title, onSeeMore: onSeeMore),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 16),
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) =>
                MovieCard(movie: movies[index], onTap: onMovieTap),
          ),
        ),
      ],
    );
  }
}
 
class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onSeeMore;
 
  const SectionHeader({required this.title, required this.onSeeMore});
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: onSeeMore,
            child: const Row(
              children: [
                Text(
                  'See More',
                  style: TextStyle(color: Colors.amber, fontSize: 13),
                ),
                SizedBox(width: 4),
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.amber, size: 13),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 
class MovieCard extends StatelessWidget {
  final HomeMovie movie;
  final void Function(String) onTap;
 
  const MovieCard({required this.movie, required this.onTap});
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(movie.id),
      child: Container(
        width: 130,
        margin: const EdgeInsets.only(right: 12),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                movie.image,
                fit: BoxFit.cover,
                width: 130,
                height: 200,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: RatingBadge(rating: movie.rating, fontSize: 11, iconSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
 