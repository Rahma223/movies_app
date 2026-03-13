import 'package:flutter/material.dart';
import 'package:movies_app/features/home/viewmodels/movie_details_viewmodel.dart';
import 'package:provider/provider.dart';

class GenresWidget extends StatelessWidget {
  const GenresWidget();
 
  @override
  Widget build(BuildContext context) {
    final genres = context.watch<MovieDetailsViewModel>().movie.genres;
 
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Genres", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: genres
                .map((g) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A3E),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white12),
                      ),
                      child: Text(g.name, style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500)),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
 
