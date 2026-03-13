import 'package:flutter/material.dart';
import 'package:movies_app/ui/utils/app_assets.dart';


import '../model/on_boarding_model.dart';

class OnBoardingViewModel extends ChangeNotifier {
  int currentIndex = 0;

  List<OnBoardingModel> pages = [
    OnBoardingModel(
      image: AppAssets.onBoarding1,
      title: 'Find Your Next\nFavorite Movie Here',
      description: 'Get access to a huge library of movies to suit all tastes.',
    ),
    OnBoardingModel(
      image: AppAssets.onBoarding2,
      title: 'Discover Movies',
      description: 'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
    ),
    OnBoardingModel(
      image: AppAssets.onBoarding3,
      title: 'Explore All Genres',
      description: 'Discover movies from every genre in all available qualities.',
    ),
    OnBoardingModel(
      image: AppAssets.onBoarding4,
      title: 'Create Watchlists',
      description: 'Save movies to your watchlist to keep track of what you want.',
    ),
    OnBoardingModel(
      image: AppAssets.onBoarding5,
      title: 'Rate, Review, and Learn',
      description: 'Share your thoughts and help others discover great movies.',
    ),
    OnBoardingModel(
      image: AppAssets.onBoarding6,
      title: 'Start Watching Now',
      description: '',
    ),
  ];

  bool get isFirst => currentIndex == 0;
  bool get isLast  => currentIndex == pages.length - 1;

  void next() {
    currentIndex++;
    notifyListeners();
  }

  void back() {
    currentIndex--;
    notifyListeners();
  }
}