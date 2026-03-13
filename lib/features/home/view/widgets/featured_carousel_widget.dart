import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/home/model/home_movie.dart';
import 'package:movies_app/features/home/view/widgets/rating_badge_widget.dart';
import 'package:movies_app/features/home/viewmodels/home_viewmodel.dart';
import 'package:provider/provider.dart';
 
class FeaturedCarouselWidget extends StatelessWidget {
  final void Function(String movieId) onMovieTap;
 
  const FeaturedCarouselWidget({required this.onMovieTap});
 
  @override
  Widget build(BuildContext context) {
    final movies = context.watch<HomeViewModel>().featuredMovies;
 
    return CarouselSlider(
      options: CarouselOptions(
        height: 350,
        viewportFraction: 0.6,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(milliseconds: 600),
        autoPlayCurve: Curves.easeInOut,
      ),
      items: movies
          .map((movie) => _CarouselCard(movie: movie, onTap: onMovieTap))
          .toList(),
    );
  }
}
 
class _CarouselCard extends StatelessWidget {
  final HomeMovie movie;
  final void Function(String) onTap;
 
  const _CarouselCard({required this.movie, required this.onTap});
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(movie.id),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              movie.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: RatingBadge(rating: movie.rating),
          ),
        ],
      ),
    );
  }
}
 