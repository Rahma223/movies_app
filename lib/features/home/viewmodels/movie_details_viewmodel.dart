import 'package:flutter/foundation.dart';
import 'package:movies_app/features/home/model/movie_model.dart';
 
class MovieDetailsViewModel extends ChangeNotifier {
  final String movieId;
 
  bool _isExpanded = false;
  bool _isBookmarked = false;
 
  bool get isExpanded => _isExpanded;
  bool get isBookmarked => _isBookmarked;
 
  MovieDetailsViewModel({required this.movieId});
 
  MovieModel get movie => MovieModel(
        id: movieId,
        title: "Doctor Strange in the Multiverse of Madness",
        poster: "assets/images/home_backgroung.png",
        backdrop: "assets/images/home_bg.png",
        rating: 7.4,
        reviewCount: 90,
        duration: "2h 6m",
        ageRating: "15",
        year: "2022",
        synopsis:
            "Following the events of Avengers: Endgame and WandaVision, Doctor Strange teams up with a mysterious apprentice who can travel between multiverses to face a powerful adversary determined to harness the same ability.",
        screenshots: [
          "assets/images/large-screenshot1.png",
          "assets/images/large-screenshot3 (1).png",
          "assets/images/large-screenshot2.png",
        ],
        similar: [
          SimilarMovie(title: "Black Widow", image: "assets/images/home_backgroung.png"),
          SimilarMovie(title: "Captain America", image: "assets/images/home_backgroung.png"),
          SimilarMovie(title: "Avengers", image: "assets/images/home_backgroung.png"),
          SimilarMovie(title: "Civil War", image: "assets/images/home_backgroung.png"),
        ],
        cast: [
          CastMember(
            name: "Hayley Atwell",
            character: "Character : Captain Carter",
            image: "assets/images/home_backgroung.png",
          ),
          CastMember(
            name: "Elizabeth Olsen",
            character: "Character : Wanda Maximoff / The Scarlet Witch",
            image: "assets/images/home_backgroung.png",
          ),
          CastMember(
            name: "Rachel McAdams",
            character: "Character : Dr. Christine Palmer",
            image: "assets/images/home_backgroung.png",
          ),
          CastMember(
            name: "Charlize Theron",
            character: "Character : Clea",
            image: "assets/images/home_backgroung.png",
          ),
        ],
        genres: [
          const Genre(name: "Action"),
          const Genre(name: "Sci-Fi"),
          const Genre(name: "Adventure"),
          const Genre(name: "Thriller"),
          const Genre(name: "Fantasy"),
          const Genre(name: "Horror"),
        ],
      );
 
  String get synopsisDisplay {
    const maxLength = 160;
    if (_isExpanded || movie.synopsis.length <= maxLength) return movie.synopsis;
    return '${movie.synopsis.substring(0, maxLength)}...';
  }
 
  bool get canExpand => movie.synopsis.length > 160;
 
  void toggleExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
 
  void toggleBookmark() {
    _isBookmarked = !_isBookmarked;
    notifyListeners();
  }
 
  void onWatch() {
    // Handle watch/play action
  }
}
 