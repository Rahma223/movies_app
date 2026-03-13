class CastMember {
  final String name;
  final String character;
  final String image;
 
  const CastMember({
    required this.name,
    required this.character,
    required this.image,
  });
}
 
class SimilarMovie {
  final String title;
  final String image;
 
  const SimilarMovie({required this.title, required this.image});
}
 
class Genre {
  final String name;
  const Genre({required this.name});
}
 
class MovieModel {
  final String id;
  final String title;
  final String poster;
  final String backdrop;
  final double rating;
  final int reviewCount;
  final String duration;
  final String ageRating;
  final String year;
  final String synopsis;
  final List<String> screenshots;
  final List<SimilarMovie> similar;
  final List<CastMember> cast;
  final List<Genre> genres;
 
  const MovieModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.backdrop,
    required this.rating,
    required this.reviewCount,
    required this.duration,
    required this.ageRating,
    required this.year,
    required this.synopsis,
    required this.screenshots,
    required this.similar,
    required this.cast,
    required this.genres,
  });
}
 