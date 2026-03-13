import 'package:flutter/material.dart';
import 'package:movies_app/features/home/viewmodels/movie_details_viewmodel.dart';
import 'package:provider/provider.dart';

class MovieInfoWidget extends StatelessWidget {
  const MovieInfoWidget();

  @override
  Widget build(BuildContext context) {
    final movie = context.watch<MovieDetailsViewModel>().movie;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildBadge(
                icon: Icons.favorite,
                label: movie.ageRating,
                color: Colors.red.shade400,
              ),
              const SizedBox(width: 12),
              buildBadge(
                icon: Icons.thumb_up_alt_rounded,
                label: movie.reviewCount.toString(),
                color: Colors.deepOrange.shade400,
              ),
              const SizedBox(width: 12),
              buildBadge(
                icon: Icons.star_rounded,
                label: movie.rating.toString(),
                color: Colors.amber,
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow, color: Colors.white),
              label: const Text(
                "Watch",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade600,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBadge({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 15),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
