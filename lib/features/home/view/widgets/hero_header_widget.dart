import 'package:flutter/material.dart';
import 'package:movies_app/features/home/view/widgets/featured_carousel_widget.dart';

class HeroHeaderWidget extends StatelessWidget {
  final void Function(String movieId) onMovieTap;
 
  const HeroHeaderWidget({required this.onMovieTap});
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 610,
      child: Stack(
        children: [
          // Full background image
          SizedBox.expand(
            child: Image.asset(
              'assets/images/home_backgroung.png',
              fit: BoxFit.fill,
            ),
          ),
 
          // Gradient overlay
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color(0xAA000000),
                  Color(0xFF1A1A1A),
                ],
                stops: [0.3, 0.7, 1.0],
              ),
            ),
          ),
 
          // bb overlay
          const Image(image: AssetImage('assets/images/bb.png')),
 
          // "Available Now" label image
          const Positioned(
            top: 40,
            left: 70,
            child: Image(image: AssetImage('assets/images/Available_now.png')),
          ),
 
          // Carousel
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: FeaturedCarouselWidget(onMovieTap: onMovieTap),
          ),
 
          // "Watch Now" label image
          const Positioned(
            bottom: 1,
            left: 30,
            child: Image(image: AssetImage('assets/images/Watch_now.png')),
          ),
        ],
      ),
    );
  }
}