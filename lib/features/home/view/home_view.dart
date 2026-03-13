import 'package:flutter/material.dart';
import 'package:movies_app/features/home/view/widgets/hero_header_widget.dart';
import 'package:movies_app/features/home/view/widgets/movie_section_widget.dart';
import 'package:movies_app/features/home/viewmodels/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/features/home/view/movie_details_view.dart';
 
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: const _HomeView(),
    );
  }
}
 
class _HomeView extends StatelessWidget {
  const _HomeView();
 
  void _navigateToDetails(BuildContext context, String movieId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MovieDetailsScreen(movieId: movieId),
      ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
 
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroHeaderWidget(
              onMovieTap: (id) => _navigateToDetails(context, id),
            ),
            const SizedBox(height: 32),
            MovieSectionWidget(
              title: 'Action',
              movies: vm.actionMovies,
              onMovieTap: (id) => _navigateToDetails(context, id),
              onSeeMore: vm.onSeeMoreTap,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}