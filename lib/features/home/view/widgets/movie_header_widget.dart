import 'package:flutter/material.dart';
import 'package:movies_app/features/home/viewmodels/movie_details_viewmodel.dart';
import 'package:provider/provider.dart';

class MovieHeaderWidget extends StatelessWidget {
  const MovieHeaderWidget();
 
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<MovieDetailsViewModel>();
    final movie = vm.movie;
 
    return Stack(
      children: [
        SizedBox(
          height: 380,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset("assets/images/Doctor Strange 1.png", fit: BoxFit.cover),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      const Color(0xFF1C1C2E).withOpacity(0.6),
                      const Color(0xFF1C1C2E),
                    ],
                    stops: const [0.3, 0.7, 1.0],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Column(
            children: [
              GestureDetector(
                onTap: vm.onWatch,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amber,
                        blurRadius: 20,
                        spreadRadius: 2,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Image.asset("assets/icons/Group 21.png", width: 24, height: 24),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                movie.year,
                style: const TextStyle(color: Colors.white60, fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
 