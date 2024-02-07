import 'package:flutter/material.dart';
import 'package:gofilm/detail_film.dart';
import 'package:gofilm/list_high_rate_movies.dart';
import 'package:gofilm/list_trending_film.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 80,
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextField(
                        controller: _controller,
                        style: const TextStyle(fontSize: 15.0),
                        decoration: InputDecoration(
                          hintText: "Search movie",
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              String searchTerm =
                                  _controller.text.toLowerCase();
                              for (Movie movie in movieList) {
                                if (movie.title.toLowerCase() == searchTerm) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetailScreenn(movie: movie),
                                    ),
                                  );
                                  return;
                                }
                              }
                              // menampilkan pesan jika film tidak ditemukan
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Movie not found!'),
                                ),
                              );
                            },
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                        ),
                      ),
                    ),
                    IconButton(
                      // icon profile
                      icon: Icon(
                        Icons.account_circle_rounded,
                        size: 40,
                        color: Colors.grey[400],
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Profile"),
                            content: const Text("Coming soon :)"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Close"),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10, bottom: 5.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Trending movies",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                margin: const EdgeInsets.only(bottom: 5),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                height: 280,
                child: SizedBox(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 10, left: 15, right: 15),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Transform.scale(
                            scale: 1,
                            child: Image.asset(imageList[index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 236, 236),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3, // 3 baris
                    childAspectRatio: 1.5, // rasio ukuran dalam Grid
                    physics:
                        const NeverScrollableScrollPhysics(), // untuk mencegah scroll GridView
                    children: [
                      IconButton(
                        icon: Image.asset(
                          'images/romance.png',
                          width: 45,
                          height: 45,
                        ),
                        onPressed: () {
                          _showDialog(context, 'Romance movies');
                        },
                      ),
                      IconButton(
                        icon: Image.asset(
                          'images/animation.png',
                          width: 45,
                          height: 45,
                        ),
                        onPressed: () {
                          _showDialog(context, 'Animation movies');
                        },
                      ),
                      IconButton(
                        icon: Image.asset(
                          'images/comedy.png',
                          width: 45,
                          height: 45,
                        ),
                        onPressed: () {
                          _showDialog(context, 'Comedy movies');
                        },
                      ),
                      IconButton(
                        icon: Image.asset(
                          'images/movie.png',
                          width: 45,
                          height: 45,
                        ),
                        onPressed: () {
                          _showDialog(context, 'Horror movies');
                        },
                      ),
                      IconButton(
                        icon: Image.asset(
                          'images/sport.png',
                          width: 45,
                          height: 45,
                        ),
                        onPressed: () {
                          _showDialog(context, 'Sport movies');
                        },
                      ),
                      IconButton(
                        icon: Image.asset(
                          'images/mystery.png',
                          width: 45,
                          height: 45,
                        ),
                        onPressed: () {
                          _showDialog(context, 'Mystery movies');
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10, bottom: 5.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "High rated movies",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.9,
                child: Column(
                  children: List.generate(
                    movieList.length,
                    (index) {
                      final movie = movieList[index];
                      return _buildMovieCard(
                        title: movie.title,
                        year: movie.year,
                        imagePath: movie.imagePath,
                        description: movie.description,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailScreenn(
                                movie: movie,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// widget untuk card
 Widget _buildMovieCard({
  required String title,
  required String year,
  required String imagePath,
  required String description,
  required VoidCallback onPressed,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
            imagePath,
            width: 150,
            height: 150,
          ),
          ),
          Flexible( // or Expanded
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16.0),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2, // Set to a suitable number of lines
                  ),
                  const SizedBox(height: 5),
                  Text(year),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 12.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


// action untuk icon jenis jenis movie
  void _showDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text("Coming soon."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }
