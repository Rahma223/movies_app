import 'package:flutter/foundation.dart';
import 'package:movies_app/features/home/model/home_movie.dart';
 
class HomeViewModel extends ChangeNotifier {
  List<HomeMovie> get featuredMovies => const [
        HomeMovie(id: "1", image: "assets/images/home_backgroung.png", rating: 8.5, genre: "Action"),
        HomeMovie(id: "2", image: "assets/images/home_backgroung.png", rating: 7.9, genre: "Action"),
        HomeMovie(id: "3", image: "assets/images/home_backgroung.png", rating: 9.0, genre: "Action"),
      ];
 
  List<HomeMovie> get actionMovies => const [
        HomeMovie(id: "4", image: "assets/images/home_backgroung.png", rating: 8.1, genre: "Action"),
        HomeMovie(id: "5", image: "assets/images/home_backgroung.png", rating: 7.5, genre: "Action"),
        HomeMovie(id: "6", image: "assets/images/home_backgroung.png", rating: 8.8, genre: "Action"),
        HomeMovie(id: "7", image: "assets/images/home_backgroung.png", rating: 7.2, genre: "Action"),
      ];
 
  void onSeeMoreTap() {
    // Handle navigation to full genre list
  }
}
 