import 'package:flutter/material.dart';
import 'package:movies_app/features/home/view/widgets/cast_widget.dart';
import 'package:movies_app/features/home/view/widgets/genres_widget.dart';
import 'package:movies_app/features/home/view/widgets/movie_header_widget.dart';
import 'package:movies_app/features/home/view/widgets/movie_info_widget.dart';
import 'package:movies_app/features/home/view/widgets/screenshots_widget.dart';
import 'package:movies_app/features/home/view/widgets/similar_movies_widget.dart';
import 'package:movies_app/features/home/view/widgets/summary_widget.dart';
import 'package:movies_app/features/home/viewmodels/movie_details_viewmodel.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MovieDetailsViewModel(movieId: movieId),
      child: const _MovieDetailsView(),
    );
  }
}

class _MovieDetailsView extends StatelessWidget {
  const _MovieDetailsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C2E),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ),
        title: const Text(
          "Movie Detials",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Consumer<MovieDetailsViewModel>(
            builder: (context, vm, _) => Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: vm.toggleBookmark,
                child: Icon(
                  vm.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            MovieHeaderWidget(),
            MovieInfoWidget(),
            SizedBox(height: 24),
            ScreenshotsWidget(),
            SizedBox(height: 24),
            SimilarMoviesWidget(),
            SizedBox(height: 24),
            SummaryWidget(),
            SizedBox(height: 24),
            CastWidget(),
            SizedBox(height: 24),
            GenresWidget(),
            SizedBox(height: 100),
          ],
        ),
      ),
      //bottomNavigationBar: const BottomBarWidget(),
    );
  }
}
