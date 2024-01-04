class Movie {
  final String title;
  final String year;
  final String imagePath;
  final String description;
  final String imdb;
  final String hours;


  Movie({
    required this.title,
    required this.year,
    required this.imagePath,
    required this.description,
    required this.imdb,
    required this.hours
  });
}

List<Movie> movieList = [
  Movie( 
    title: "The Shawshank Redemption",
    year: "1994",
    imagePath: "images/shawshank.jpg",
    description: "Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion.",
    imdb: "(9.3/10)",
    hours: "2h 22m"
  ),
  Movie(
    title: "The Godfather",
    year: "1972",
    imagePath: "images/thegodfather.jpg",
    description: "Don Vito Corleone, head of a mafia family, decides to hand over his empire to his youngest son Michael. However, his decision unintentionally puts the lives of his loved ones in grave danger.",
    imdb: "(9.2/10)",
    hours: "2h 55m"
  ),
  Movie(
    title: "The Dark Knight",
    year: "2008",
    imagePath: "images/thedarknight.jpg",
    description: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
    imdb: "(9.0/10)",
    hours: "2h 32m"
  ),
  Movie(
    title: "The Godfather Part II",
    year: "1974",
    imagePath: "images/thegodfather2.jpg",
    description: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
    imdb: "(9.0/10)",
    hours: "3h 22m"
  ),
  Movie(
    title: "12 Angry Men",
    year: "1957",
    imagePath: "images/12angrymen.jpg",
    description: "The jury in a New York City murder trial is frustrated by a single member whose skeptical caution forces them to more carefully consider the evidence before jumping to a hasty verdict.",
    imdb: "(9.0/10)",
    hours: "1h 36m"
  ),
];
