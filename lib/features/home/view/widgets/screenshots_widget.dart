import 'package:flutter/material.dart';
import 'package:movies_app/features/home/viewmodels/movie_details_viewmodel.dart';
import 'package:provider/provider.dart';

class ScreenshotsWidget extends StatelessWidget {
  const ScreenshotsWidget();

  @override
  Widget build(BuildContext context) {
    final screenshots = context
        .watch<MovieDetailsViewModel>()
        .movie
        .screenshots;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Screen Shots",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 440,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(left: 16),
            itemCount: screenshots.length,
            itemBuilder: (context, index) => Container(
              width: 190,
              margin: const EdgeInsets.only(right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(screenshots[index], fit: BoxFit.cover),
              ),
            ),
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 12);
            },
          ),
        ),
      ],
    );
  }
}
